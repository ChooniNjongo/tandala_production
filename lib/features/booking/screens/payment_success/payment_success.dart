import 'package:cwt_ecommerce_admin_panel/features/booking/screens/payment_success/responsive_screens/payment_success_mobile.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/layouts/templates/site_layout.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      useLayout: false,
      desktop: PaymentSuccessMobileScreen(),
      tablet: PaymentSuccessMobileScreen(),
      mobile: PaymentSuccessMobileScreen(),
    );
  }
}
