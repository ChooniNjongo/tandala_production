import 'package:cwt_ecommerce_admin_panel/features/authentication/screens/password_configuration/reset_password/reset_password.dart';
import 'package:cwt_ecommerce_admin_panel/features/booking/screens/booking_request/booking_request.dart';
import 'package:cwt_ecommerce_admin_panel/features/booking/screens/bookings_history/bookings.dart';
import 'package:cwt_ecommerce_admin_panel/features/media/screens/media/media.dart';
import 'package:cwt_ecommerce_admin_panel/features/personalization/screens/profile/profile.dart';
import 'package:cwt_ecommerce_admin_panel/features/personalization/screens/settings/settings.dart';
import 'package:cwt_ecommerce_admin_panel/features/shop/screens/banner/edit_banner/edit_banner.dart';
import 'package:cwt_ecommerce_admin_panel/features/shop/screens/brand/all_brands/brands.dart';
import 'package:cwt_ecommerce_admin_panel/features/shop/screens/category/all_categories/categories.dart';
import 'package:cwt_ecommerce_admin_panel/features/shop/screens/category/create_category/create_category.dart';
import 'package:cwt_ecommerce_admin_panel/features/shop/screens/category/edit_category/edit_category.dart';
import 'package:cwt_ecommerce_admin_panel/features/shop/screens/coupon/all_coupons/coupons.dart';
import 'package:cwt_ecommerce_admin_panel/features/shop/screens/customer/all_customers/customers.dart';
import 'package:cwt_ecommerce_admin_panel/features/shop/screens/order/all_orders/orders.dart';
import 'package:cwt_ecommerce_admin_panel/features/shop/screens/order/orders_detail/order_detail.dart';
import 'package:cwt_ecommerce_admin_panel/features/shop/screens/product/create_product/create_product.dart';
import 'package:cwt_ecommerce_admin_panel/features/shop/screens/product/edit_product/edit_product.dart';
import 'package:get/get.dart';
import '../features/authentication/screens/forget_password/forget_password.dart';
import '../features/authentication/screens/login/login.dart';
import '../features/booking/screens/active_bookings/active_bookings.dart';
import '../features/booking/screens/booking_completed/booking_completed.dart';
import '../features/booking/screens/booking_room/booking_room.dart';
import '../features/booking/screens/home/home.dart';
import '../features/booking/screens/listing_photo_gallery/photo_gallery.dart';
import '../features/booking/screens/listing_viewing/listing_viewing.dart';
import '../features/booking/screens/payment_success/payment_success.dart';
import '../features/booking/screens/room_photo_gallery/room_photo_gallery.dart';
import '../features/booking/screens/room_selection/room_selection.dart';
import '../features/booking/screens/room_viewing/room_viewing.dart';
import '../features/listing/screens/add_another_room_prompt/add_another_room_prompt.dart';
import '../features/listing/screens/add_room/add_room.dart';
import '../features/listing/screens/add_room_details/add_room_details.dart';
import '../features/listing/screens/amenities/amenities.dart';
import '../features/listing/screens/checklist/checklist.dart';
import '../features/listing/screens/description/description.dart';
import '../features/listing/screens/display_cover/display_cover.dart';
import '../features/listing/screens/done/done.dart';
import '../features/listing/screens/listing_step/listing_step.dart';
import '../features/listing/screens/listings/listings.dart';

import '../features/listing/screens/location/location.dart';
import '../features/listing/screens/name_and_city/name_and_city.dart';
import '../features/listing/screens/property_type/property_type.dart';
import '../features/listing/screens/upload_photos/upload_photos.dart';
import '../features/shop/screens/banner/all_banners/banners.dart';
import '../features/shop/screens/banner/create_banner/create_banner.dart';
import '../features/shop/screens/brand/create_brand/create_brand.dart';
import '../features/shop/screens/brand/edit_brand/edit_brand.dart';
import '../features/shop/screens/customer/customer_detail/customer.dart';
import '../features/shop/screens/dashboard/dashboard.dart';
import '../features/shop/screens/product/all_products/products.dart';
import 'routes.dart';
import 'routes_middleware.dart';

class TAppRoute {
  static final List<GetPage> pages = [
    // Authentication
    GetPage(name: TRoutes.login, page: () => const LoginScreen()),
    GetPage(
        name: TRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(
        name: TRoutes.resetPassword, page: () => const ResetPasswordScreen()),
    GetPage(
        name: TRoutes.dashboard,
        page: () => const DashboardScreen(),
        middlewares: [TRouteMiddleware()]),
    GetPage(
        name: TRoutes.media,
        page: () => const MediaScreen(),
        middlewares: [TRouteMiddleware()]),

    ///  Booking Process
    GetPage(name: TRoutes.places, page: () => const HomeScreen()),
    GetPage(
      name: TRoutes.listingViewing,
      page: () => const ListingViewingScreen(),
      transition: Transition.rightToLeft, // 👈 Set transition here
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: TRoutes.photoGallery,
      page: () => const PhotoGalleryScreen(),
      transition: Transition.rightToLeft, // 👈 Set transition here
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: TRoutes.roomSelection,
      page: () => const RoomSelectionScreen(),
      transition: Transition.rightToLeft, // 👈 Set transition here
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: TRoutes.roomViewing,
      page: () => const RoomViewingScreen(),
      transition: Transition.rightToLeft, // 👈 Set transition here
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: TRoutes.roomPhotoGallery,
      page: () => const RoomPhotoGalleryScreen(),
      transition: Transition.rightToLeft, // 👈 Set transition here
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
        name: TRoutes.bookingRequest,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const BookingRequestScreen(),
        middlewares: [TRouteMiddleware()]),

    GetPage(
        name: TRoutes.bookingsHistory,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const BookingsHistoryScreen(),
        middlewares: [TRouteMiddleware()]),
    GetPage(
        name: TRoutes.activeBookings,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const ActiveBookingsScreen(),
        middlewares: [TRouteMiddleware()]),
    GetPage(
        name: TRoutes.bookingRoom,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const BookingRoomScreen(),
        middlewares: [TRouteMiddleware()]),
    GetPage(
        name: TRoutes.paymentSuccess,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const PaymentSuccessScreen(),
        middlewares: [TRouteMiddleware()]),
    GetPage(
        name: TRoutes.bookingComplete,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const BookingCompletedScreen(),
        middlewares: [TRouteMiddleware()]),

    // Banners
    GetPage(
        name: TRoutes.banners,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const BannersScreen(),
        middlewares: [TRouteMiddleware()]),
    GetPage(
        name: TRoutes.createBanner,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const CreateBannerScreen(),
        middlewares: [TRouteMiddleware()]),
    GetPage(
        name: TRoutes.editBanner,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const EditBannerScreen(),
        middlewares: [TRouteMiddleware()]),

    /// Listings Management

    /// Listing Screens
    GetPage(
      name: TRoutes.listingStage,
      transition: Transition.rightToLeft, // 👈 Set transition here
      transitionDuration: const Duration(milliseconds: 500),
      page: () => const ListingStageMobileScreen(),
    ),
    GetPage(
      name: TRoutes.addAnotherRoomPrompt,
      transition: Transition.rightToLeft, // 👈 Set transition here
      transitionDuration: const Duration(milliseconds: 500),
      page: () => const AddAnotherRoomPromptScreen(),
    ),
    GetPage(
        name: TRoutes.addRoom,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const AddRoomScreen()),
    GetPage(
      name: TRoutes.addRoomDetails,
      transition: Transition.rightToLeft, // 👈 Set transition here
      transitionDuration: const Duration(milliseconds: 500),
      page: () => const AddRoomDetailsScreen(),
    ),
    GetPage(
        name: TRoutes.amenities,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const AmenitiesScreen()),

    GetPage(
        name: TRoutes.checklist,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const ChecklistScreen()),
    GetPage(
        name: TRoutes.description,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const DescriptionsScreen()),
    GetPage(
        name: TRoutes.displayCover,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const DisplayCoverScreen()),
    GetPage(
        name: TRoutes.done,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const DoneScreen()),
    GetPage(
        name: TRoutes.listings,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const ListingsScreen()),
    GetPage(
        name: TRoutes.location,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const LocationScreen()),
    GetPage(
        name: TRoutes.nameAndCity,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const NameAndCityScreen()),
    GetPage(
        name: TRoutes.propertyType,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const PropertyTypeScreen()),
    GetPage(
        name: TRoutes.uploadPhotos,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const UploadPhotosScreen()),

    // Products
    GetPage(
        name: TRoutes.products,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const ProductsScreen(),
        middlewares: [TRouteMiddleware()]),
    GetPage(
        name: TRoutes.createProduct,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const CreateProductScreen(),
        ),
    GetPage(
        name: TRoutes.editProduct,
        page: () => const EditProductScreen(),
        middlewares: [TRouteMiddleware()]),

    // Categories
    GetPage(
        name: TRoutes.categories,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const CategoriesScreen(),
        middlewares: [TRouteMiddleware()]),
    GetPage(
        name: TRoutes.createCategory,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const CreateCategoryScreen(),
        middlewares: [TRouteMiddleware()]),
    GetPage(
        name: TRoutes.editCategory,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const EditCategoryScreen(),
        middlewares: [TRouteMiddleware()]),

    // Brands
    GetPage(
        name: TRoutes.brands,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const BrandsScreen(),
        middlewares: [TRouteMiddleware()]),
    GetPage(
        name: TRoutes.createBrand,
        page: () => const CreateBrandScreen(),
        middlewares: [TRouteMiddleware()]),
    GetPage(
        name: TRoutes.editBrand,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const EditBrandScreen(),
        middlewares: [TRouteMiddleware()]),

    // Coupons
    GetPage(
        name: TRoutes.brands,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const BrandsScreen(),
        middlewares: [TRouteMiddleware()]),
    GetPage(
        name: TRoutes.createBrand,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const CreateBrandScreen(),
        middlewares: [TRouteMiddleware()]),
    GetPage(
        name: TRoutes.editBrand,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const EditBrandScreen(),
        middlewares: [TRouteMiddleware()]),

    // Customers
    GetPage(
        name: TRoutes.customers,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const CustomersScreen(),
        middlewares: [TRouteMiddleware()]),
    GetPage(
        name: TRoutes.customerDetails,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const CustomerDetailScreen(),
        middlewares: [TRouteMiddleware()]),

    // Orders
    GetPage(
        name: TRoutes.orders,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const OrdersScreen(),
        middlewares: [TRouteMiddleware()]),
    GetPage(
        name: TRoutes.orderDetails,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const OrderDetailScreen(),
        middlewares: [TRouteMiddleware()]),

    // Coupons
    GetPage(
        name: TRoutes.coupons,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const CouponsScreen(),
        middlewares: [TRouteMiddleware()]),
    GetPage(
        name: TRoutes.settings,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const SettingsScreen(),
        middlewares: [TRouteMiddleware()]),
    GetPage(
        name: TRoutes.profile,
        transition: Transition.rightToLeft, // 👈 Set transition here
        transitionDuration: const Duration(milliseconds: 500),
        page: () => const ProfileScreen(),
        middlewares: [TRouteMiddleware()]),
  ];
}
