import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../data/repositories/booking/booking_repository.dart';
import '../../../data/repositories/listing/listing_repository.dart';
import '../../../data/repositories/user/temp_user_repository.dart' show UserRepository;
import '../../../routes/routes.dart';
import '../models/booking/booking.dart';
import '../models/booking/booking_notification.dart';
import '../models/booking/booking_request.dart';
import '../models/booking/booking_stages.dart';
import '../models/booking/payment.dart';
import '../models/property/listing_model.dart';
import '../models/property/property_review.dart';

class BookingController extends GetxController {
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
      final storage = GetStorage();
      final uid = storage.read("uid") as String?;
      // Fetch Chats
      final userBookingsNotifications = await bookingRepository
          .getUserBookingsNotifications(uid!);

      if (kDebugMode) {
        print("${userBookingsNotifications.length} ******Bookings***** $uid}");
      }

      if (userBookingsNotifications.isNotEmpty) {
        // Assign Chats
        bookingNotifications.assignAll(userBookingsNotifications);
      } else {
        // Handle case where bookings list is null
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

  /*   Method to retrieve user chats using userId in the process update isRetrievingUserChats accordingly and userChats.obs */
  Future<void> fetchUserBookings() async {
    try {
      // Show loader while loading Chats
      isRetrievingUserBookings.value = true;
      final storage = GetStorage();
      final uid = storage.read("uid") as String?;
      // Fetch Chats
      final bookings = await bookingRepository.getUserBookings(uid!);
      if (kDebugMode) {
        print("${bookings.length} ******Bookings***** $uid}");
      }

      if (bookings.isNotEmpty) {
        // Assign Chats
        userBookings.assignAll(bookings);
        numberOfUnCompletedBookings.value = getActiveBookings();


      } else {
        // Handle case where bookings list is null
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Stop Loader
      isRetrievingUserBookings.value = false;
    }
  }

  void submitBookingRequest(BookingRequest bookingRequest) async {
    final storage = GetStorage();
    final uid = storage.read("uid") as String?;
    if (uid != null) {
      bookingRequest.bookieUserId = uid;
      try {
        // Show loader while loading Chats
        isSubmittingABookingRequest.value = true;
        await bookingRepository.submitBookingRequest(bookingRequest);
        TLoaders.customToast(
          message: 'Congratulations! Booking request submitted',
        );
        fetchUserBookings();
        Get.offAllNamed(TRoutes.bookings);
      } catch (e) {
        TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      } finally {
        // Stop Loader
        isSubmittingABookingRequest.value = false;
      }
    } else {
      Get.offAllNamed(TRoutes.loginIntro);
    }
  }

  void confirmAvailability(String bookingId, bool isAvailable) async {
    try {
      // Show loader while loading Chats
      isConfirmingAvailability.value = true;

      final booking = await bookingRepository.confirmAvailability(
        bookingId: bookingId,
        isAvailable: isAvailable,
      );
      TLoaders.customToast(message: 'Availability Successfully Updated');
      fetchUserBookings();
      Get.toNamed(TRoutes.bookings);

      selectedBooking.value = booking;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Stop Loader
      isConfirmingAvailability.value = false;
    }
  }

  void payForBooking(Booking booking) async {
    final payment = Payment(
      bookingId: booking.bookingId,
      userId: booking.bookieUserId,
      bookingFee: booking.bookingAmountTotal,
      userFee: booking.bookingBookieFee,
      taxFee: booking.bookingTaxFee,
      date: DateTime.now(),
    );
    try {
      // Show loader while loading Chats
      isPayingForBooking.value = true;

      final booking = await bookingRepository.payForBooking(payment);
      TLoaders.successSnackBar(title: 'Payment Successful');
      selectedBooking.value = booking;

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
      // Show loader while loading Chats
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
    isRefreshingBookings.value = true;
    try {
      // Fetch Chats
      final bookings = await bookingRepository.getUserBookings(
        AuthenticationRepository.instance.authUser!.uid,
      );

      int num = 0;

      for (var element in bookings) {
        if (!element.isComplete) {
          num += 1;
        }
      }
      numberOfUnCompletedBookings.value = num;

      // Assign Chats
      userBookings.assignAll(bookings);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      isRefreshingBookings.value = false;
    }
  }

  void checkIn(String bookingId) async {
    try {
      isCheckingBookie.value = true;
      final booking = await bookingRepository.checkIn(bookingId);
      selectedBooking.value = booking;
      fetchUserBookings();
      TLoaders.customToast(message: "Checked in successfully");
      Get.toNamed(TRoutes.bookings);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      isCheckingBookie.value = false;
    }
  }

  void cancelBooking(String bookingId) async {
    try {
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
    return await PropertyRepository.instance.getListingForBooking(
      listingId: listingId,
      latitude: userLatitude.value,
      longitude: userLongitude.value,
    );
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
}
