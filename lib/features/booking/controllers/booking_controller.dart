import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../data/abstract/base_data_table_controller.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../data/repositories/booking/booking_repository.dart';
import '../../../data/repositories/listing/listing_repository.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../routes/routes.dart';
import '../models/booking/booking.dart';
import '../models/booking/booking_notification.dart';
import '../models/booking/booking_request.dart';
import '../models/booking/booking_stages.dart';
import '../models/booking/payment.dart';
import '../models/property/listing_model.dart';
import '../models/property/property_review.dart';

class BookingController extends TBaseController<Booking> {
  static BookingController get instance => Get.find();

  /// Variables
  // UI state
  final numberOfUnCompletedBookings = 0.obs;

  // Loader state managers
  final isRetrievingUserBookings = false.obs;
  final isSubmittingABookingRequest = false.obs;
  final isConfirmingAvailability = false.obs;
  final isPayingForBooking = false.obs;
  final isSubmittingPropertyReview = false.obs;
  final isRefreshingBookings = false.obs;
  final isCheckingBookie = false.obs;
  final selectedBooking = Rx<Booking?>(null);
  final checkInDate = DateTime.now().obs;
  final checkOutDate = DateTime.now().add(const Duration(days: 1)).obs;

  /// Booking Request Process
  final numberOfNightBooked = 1.obs;
  final bookingTotal = 0.obs;

  // Holder Model Objects
  final RxList<Booking> userBookings = <Booking>[].obs;
  final RxList<BookingNotification> bookingNotifications =
      <BookingNotification>[].obs;

  // Repositories
  final bookingRepository = Get.put(BookingRepository());

  // Location
  /// Variables
  final userRepository = Get.put(UserRepository());
  Rx<double> userLatitude = 0.0.obs;
  Rx<double> userLongitude = 0.0.obs;

  /// Check if the user is authenticated
  bool get isUserLoggedIn => AuthenticationRepository.instance.authUser != null;

  /// Get current user ID safely
  String? get currentUserId => AuthenticationRepository.instance.authUser?.uid;

  void initGetLocation() async {
    await userRepository.getCurrentLocation().then((value) {
      userLatitude.value = value.latitude;
      userLongitude.value = value.longitude;
    });
  }

  @override
  void onInit() {
    fetchUserBookings();
    initGetLocation();
    super.onInit();
  }

  void fetchUserBookingNotifications() async {
    try {
      // Check if user is authenticated
      if (!isUserLoggedIn || currentUserId == null) {
        bookingNotifications.clear();
        return;
      }

      // Fetch notifications for authenticated user
      final userBookingsNotifications =
          await bookingRepository.getUserBookingsNotifications(currentUserId!);

      if (kDebugMode) {
        print(
            "${userBookingsNotifications.length} ******Bookings***** $currentUserId}");
      }

      if (userBookingsNotifications.isNotEmpty) {
        // Assign notifications
        bookingNotifications.assignAll(userBookingsNotifications);
      } else {
        // Handle case where notifications list is empty
        bookingNotifications.clear();
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  void updateNumberOfNights(DateTime startDate, DateTime endDate, int price) {
    final nights = endDate.difference(startDate).inDays;
    numberOfNightBooked.value =
        nights > 0 ? nights : 1; // Ensure at least 1 night
    bookingTotal.value = price.toInt() * numberOfNightBooked.value;
  }

  void selectBooking(Booking booking) {
    selectedBooking.value = booking;
    update(); // Notify listeners
  }

  /*   Method to retrieve user bookings using userId in the process update isRetrievingUserBookings accordingly and userBookings.obs */
  Future<void> fetchUserBookings() async {
    try {
      // Show loader while loading bookings
      isRetrievingUserBookings.value = true;

      // Check if user is authenticated
      if (!isUserLoggedIn || currentUserId == null) {
        userBookings.clear();
        numberOfUnCompletedBookings.value = 0;
        return;
      }

      // Fetch bookings for authenticated user
      final bookings = await bookingRepository.getUserBookings(currentUserId!);

      if (bookings.isNotEmpty) {
        // Assign bookings
        userBookings.assignAll(bookings);
        numberOfUnCompletedBookings.value = getActiveBookings();
        // Notify listeners about the change
        update();
      } else {
        // Handle case where bookings list is empty
        userBookings.clear();
        numberOfUnCompletedBookings.value = 0;
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Stop Loader
      isRetrievingUserBookings.value = false;
    }
  }

  void submitBookingRequest(BookingRequest bookingRequest) async {
    try {
      // Check if user is authenticated
      if (!isUserLoggedIn) {
        TLoaders.errorSnackBar(
          title: 'Authentication Required',
          message: 'Please log in to submit a booking request',
        );
        Get.toNamed(TRoutes.login); // Navigate to login page
        return;
      }

      // Show loader while submitting request
      isSubmittingABookingRequest.value = true;
      await bookingRepository.submitBookingRequest(bookingRequest);
      TLoaders.customToast(
        message: 'Congratulations! Booking request submitted',
      );
      fetchUserBookings();
      Get.offAllNamed(TRoutes.places);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Stop Loader
      isSubmittingABookingRequest.value = false;
    }
  }

  void confirmAvailability(String bookingId, bool isAvailable) async {
    try {
      // Check if user is authenticated
      if (!isUserLoggedIn) {
        TLoaders.errorSnackBar(
          title: 'Authentication Required',
          message: 'Please log in to confirm availability',
        );
        Get.toNamed(TRoutes.login); // Navigate to login page
        return;
      }

      // Show loader while confirming availability
      isConfirmingAvailability.value = true;

      final booking = await bookingRepository.confirmAvailability(
        bookingId: bookingId,
        isAvailable: isAvailable,
      );
      TLoaders.customToast(message: 'Availability Successfully Updated');
      fetchUserBookings();
      Get.toNamed(TRoutes.places);
      selectedBooking.value = booking;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Stop Loader
      isConfirmingAvailability.value = false;
    }
  }

  void payForBooking(Booking booking) async {
    try {
      // Check if user is authenticated
      if (!isUserLoggedIn) {
        TLoaders.errorSnackBar(
          title: 'Authentication Required',
          message: 'Please log in to make a payment',
        );
        Get.toNamed(TRoutes.login); // Navigate to login page
        return;
      }

      final payment = Payment(
        bookingId: booking.bookingId,
        userId: booking.bookieUserId,
        bookingFee: booking.bookingAmountTotal,
        userFee: booking.bookingBookieFee,
        taxFee: booking.bookingTaxFee,
        date: DateTime.now(),
      );

      // Show loader while processing payment
      isPayingForBooking.value = true;

      final updatedBooking = await bookingRepository.payForBooking(payment);
      TLoaders.customToast(message: 'Payment successful');
      selectedBooking.value = updatedBooking;

      fetchUserBookings();
      Get.toNamed(TRoutes.paymentSuccess);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Stop Loader
      isPayingForBooking.value = false;
    }
  }

  void submitPropertyReview(PropertyReview propertyReview) async {
    try {
      // Check if user is authenticated
      if (!isUserLoggedIn) {
        TLoaders.errorSnackBar(
          title: 'Authentication Required',
          message: 'Please log in to submit a review',
        );
        Get.toNamed(TRoutes.login); // Navigate to login page
        return;
      }

      // Show loader while submitting review
      isSubmittingPropertyReview.value = true;

      await bookingRepository.reviewProperty(propertyReview);
      TLoaders.customToast(message: "Review Submitted.");
      fetchUserBookings();
      Get.toNamed(TRoutes.bookings);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Stop Loader
      isSubmittingPropertyReview.value = false;
    }
  }

  void refreshBookings() async {
    try {
      // Check if user is authenticated
      if (!isUserLoggedIn || currentUserId == null) {
        userBookings.clear();
        numberOfUnCompletedBookings.value = 0;
        return;
      }

      isRefreshingBookings.value = true;

      // Fetch bookings for authenticated user
      final bookings = await bookingRepository.getUserBookings(currentUserId!);

      int num = 0;

      for (var element in bookings) {
        if (!element.isComplete) {
          num += 1;
        }
      }
      numberOfUnCompletedBookings.value = num;

      // Assign bookings
      userBookings.assignAll(bookings);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      isRefreshingBookings.value = false;
    }
  }

  void checkIn(String bookingId) async {
    try {
      // Check if user is authenticated
      if (!isUserLoggedIn) {
        TLoaders.errorSnackBar(
          title: 'Authentication Required',
          message: 'Please log in to check in',
        );
        Get.toNamed(TRoutes.login); // Navigate to login page
        return;
      }

      isCheckingBookie.value = true;
      final booking = await bookingRepository.checkIn(bookingId);
      selectedBooking.value = booking;
      fetchUserBookings();
      TLoaders.customToast(message: "Checked in successfully. Enjoy your stay");
      Get.toNamed(TRoutes.bookings);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      isCheckingBookie.value = false;
    }
  }

  void cancelBooking(String bookingId) async {
    try {
      // Check if user is authenticated
      if (!isUserLoggedIn) {
        TLoaders.errorSnackBar(
          title: 'Authentication Required',
          message: 'Please log in to cancel a booking',
        );
        Get.toNamed(TRoutes.login); // Navigate to login page
        return;
      }

      isCheckingBookie.value = true;
      await bookingRepository.cancelBooking(bookingId);
      fetchUserBookings();
      TLoaders.customToast(message: "Booking cancelled");
      Get.toNamed(TRoutes.bookings);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      isCheckingBookie.value = false;
    }
  }

  Future<List<ListingModel>> getListingForBooking(String listingId) async {
    try {
      return await PropertyRepository.instance.getListingForBooking(
        listingId: listingId,
        latitude: userLatitude.value,
        longitude: userLongitude.value,
      );
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }

  /// Function to get the number of active bookings
  int getActiveBookings() {
    return userBookings
        .where(
          (booking) =>
              booking.bookingStage == BookingStage.Availability ||
              booking.bookingStage == BookingStage.Payment ||
              booking.bookingStage == BookingStage.CheckIn ||
              booking.bookingStage == BookingStage.Review,
        )
        .length;
  }

  @override
  Future<List<Booking>> fetchItems() async {
    try {
      // Set sorting order for the table
      sortAscending.value = false;

      // Check if user is authenticated
      if (!isUserLoggedIn || currentUserId == null) {
        return [];
      }

      // Use the existing bookingRepository to fetch bookings
      return await bookingRepository.getUserBookings(currentUserId!);
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching items: $e');
      }
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }

  void sortById(int sortColumnIndex, bool ascending) {
    sortByProperty(sortColumnIndex, ascending,
        (Booking o) => o.bookingAmountTotal.toString().toLowerCase());
  }

  void sortByDate(int sortColumnIndex, bool ascending) {
    sortByProperty(sortColumnIndex, ascending,
        (Booking o) => o.bookingStart.toString().toLowerCase());
  }

  @override
  bool containsSearchQuery(Booking item, String query) {
    return item.bookingId.toLowerCase().contains(query.toLowerCase());
  }

  @override
  Future<void> deleteItem(Booking item) async {
    //await _orderRepository.deleteOrder(item.docId);
  }
}
