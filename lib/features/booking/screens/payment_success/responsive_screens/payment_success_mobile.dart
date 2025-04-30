import 'package:flutter/material.dart';

import '../../../../../common/pages/success.dart';
import '../../../../../utils/constants/image_strings.dart';

class PaymentSuccessMobileScreen extends StatelessWidget {
  const PaymentSuccessMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessPage(
      image: TImages.paymentSuccessfulAnimation,
      title: "Payment Success",
      subTitle: "Your payment was successfully processed",
    );
  }
}
