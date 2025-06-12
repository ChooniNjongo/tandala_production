import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';

class LoginScreenMobile extends StatelessWidget {
  const LoginScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(TSizes.defaultSpaceDesktop),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              ///  Header
              TLoginHeader(),

              /// Form
              TLoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
