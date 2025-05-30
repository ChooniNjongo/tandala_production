// routes.dart

class TRoutes {


  /// Authentication Routes
  static const intro = '/intro';
  static const onboarding = '/onboarding';
  static const signUpIntro = '/signUpIntro';
  static const emailSignUp = '/emailSignUp';
  static const phoneSignUp = '/phoneSignUp';
  static const loginIntro = '/loginIntro';
  static const emailSignIn = '/emailSignIn';
  static const phoneSignIn = '/phoneSignIn';

  static const navigationMenu = '/navigationMenu';
  static const login = '/login';
  static const logout = '/logout';
  static const places = '/';
  static const forgetPassword = '/forge-password/';
  static const resetPassword = '/reset-password';

  /// Booking Process Screens

  static const photoGallery = '/photoGallery';
  // Personalized Links
  static const myListing = '/myListing';
  static const wishlist = '/wishlist';
  static const reviews = '/reviews';
  static const listingReports = '/listingReport';
  static const suggestions = '/suggestions';
  static const help = '/help';
  static const accountInfo = '/accountInfo';
  static const updateUsername = '/updateUsername';
  static const updateProfilePhoto = '/updateProfilePhoto';
  static const roomPhotoGallery = '/roomPhotoGallery';

  // Listings
  static const loadUserDraftListingScreen = '/loadUserDraftListingScreen';
  static const searchResults = '/searchResults';
  static const listingViewing = '/listingViewing';
  static const listingPhotoTour = '/photoTour';
  static const banners = '/banners';
  static const createBanner = '/createBanner';

  // Room
  static const roomViewing = '/roomViewing';
  static const roomSelection = '/roomSelection';

  // Suggestion
  static const sendSuggestion = '/sendSuggestion';

  // Bookings
  static const bookingsHistory = '/bookingsHistory';
  static const activeBookings = '/activeBookings';
  static const bookingRequest = '/bookingRequest';
  static const availabilityCheck = '/availabilityCheck';
  static const bookingComplete = '/bookingComplete';
  static const bookingRoom = '/bookingRoom';
  static const payment = '/payment';
  static const checkIn = '/checkIn';
  static const paymentSuccess = '/paymentSuccess';
  static const review = '/review';
  static const messages = '/messages';
  static const account = '/account';
  static const profile = '/profile';
  static const createProducts = '/createProducts';
  static const editProducts = '/editProducts';
  static const categories = '/categories';
  static const createCategory = '/createCategory';
  static const editCategory = '/editCategory';
  static const brands = '/brands';
  static const createBrand = '/createBrand';
  static const editBrand = '/editBrand';
  static const customers = '/customers';
  static const createCustomer = '/createCustomer';
  static const customerDetails = '/customerDetails';
  static const orders = '/orders';
  static const pageNotFound = '/page-not-found';

  // Listing Steps
  static const listingStage = '/listingStage';
  static const checklist = '/checklist';
  static const addAnotherRoomPrompt = '/addAnotherRoomPrompt';
  static const addRoom = '/addRoom';
  static const addRoomDetails = '/addRoomDetails';
  static const amenities = '/amenities';
  static const description = '/description';
  static const displayCover = '/displayCover';
  static const done = '/done';
  static const listings = '/listings';
  static const createListing = '/createListing';
  static const location = '/location';
  static const nameAndCity = '/nameAndCity';
  static const propertyType = '/propertyType';
  static const uploadPhotos = '/uploadPhotos';


  static const dashboard = '/dashboard';
  static const media = '/media';

  static const editBanner = '/editBanner';

  static const products = '/products';
  static const createProduct = '/createProducts';
  static const editProduct = '/editProduct';

  static const orderDetails = '/orderDetails';

  static const coupons = '/coupons';
  static const createCoupon = '/createCoupon';
  static const editCoupon = '/editCoupon';

  static const settings = '/settings';


  static List sideMenuItems = [
    logout,
    places,
    bookingsHistory,
    messages,
    wishlist,
    listingStage,
    createListing,
    login,
    forgetPassword,
    dashboard,
    media,
    products,
    listings,
    categories,
    brands,
    customers,
    orders,
    coupons,
    settings,
    profile,
  ];

}

// All App Screens
class AppScreens {
  static const home = '/';
  static const store = '/store';
  static const favourites = '/favourites';
  static const settings = '/settings';
  static const subCategories = '/sub-categories';
  static const search = '/search';
  static const productReviews = '/product-reviews';
  static const productDetail = '/product-detail';
  static const order = '/order';
  static const checkout = '/checkout';
  static const cart = '/cart';
  static const brand = '/brand';
  static const allProducts = '/all-products';
  static const userProfile = '/user-profile';
  static const userAddress = '/user-address';
  static const signUp = '/signup';
  static const signupSuccess = '/signup-success';
  static const verifyEmail = '/verify-email';
  static const signIn = '/sign-in';
  static const resetPassword = '/reset-password';
  static const forgetPassword = '/forget-password';
  static const onBoarding = '/on-boarding';

  static List<String> allAppScreenItems = [
    onBoarding,
    signIn,
    signUp,
    verifyEmail,
    resetPassword,
    forgetPassword,
    home,
    store,
    favourites,
    settings,
    subCategories,
    search,
    productDetail,
    productReviews,
    order,
    checkout,
    cart,
    brand,
    allProducts,
    userProfile,
    userAddress,
  ];
}
