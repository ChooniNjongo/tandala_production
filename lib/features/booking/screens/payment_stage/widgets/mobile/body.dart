import 'package:cwt_ecommerce_admin_panel/features/booking/screens/payment_stage/widgets/mobile/user_payment_section.dart';
import 'package:flutter/material.dart';
import '../../../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/booking/booking.dart';
import 'lister_payment_section.dart';

class PaymentBody extends StatelessWidget {
  final Booking booking;

  const PaymentBody({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final uid = AuthenticationRepository.instance.authUser!.uid;
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: uid == booking.listing.userId
          ?  ListerPaymentSection(booking:booking)
          :  UserPaymentSection(booking:booking),
    );
  }
}
