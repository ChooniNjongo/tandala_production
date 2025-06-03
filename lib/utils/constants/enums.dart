/* --
      LIST OF Enums
      They cannot be created inside a class.
-- */

enum AppRole { Admin, User }

enum BookingStage {
  Availability,
  Payment,
  CheckIn,
  Review,
  Completed,
  Cancelled
}

enum TransactionType { buy, sell }

enum ProductType { single, variable }

enum ProductVisibility { published, hidden }

enum TextSizes { small, medium, large }

enum ImageType { asset, network, memory, file }

enum MediaCategory { folders, banners, brands, categories, products, users }

enum OrderStatus { pending, processing, shipped, delivered, cancelled }

enum PaymentMethods {
  paypal,
  googlePay,
  applePay,
  visa,
  masterCard,
  creditCard,
  paystack,
  razorPay,
  paytm
}

enum PropertyType { Hotel, Apartment, Lodge, GuestHouse, Other }

enum Owner { Person, Business }

enum ListingCategory { SingleHost, MultiHost }

enum ListingStage {
  StepOne,
  StepTwo,
  StepThree,
  StepFour,
  StepFive,
  StepSix,
  StepSeven,
  StepEight,
  StepNine,
  StepTen,
  StepEleven,
  StepTwelve,
}
