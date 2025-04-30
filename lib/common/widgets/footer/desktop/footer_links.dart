import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import 'footer_link_text.dart';
import 'footer_link_title.dart';

class FooterLinks extends StatelessWidget {
  const FooterLinks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FooterSectionTitle(
              title: "Tandala",
            ),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            FooterLink(
              title: 'List your properpty',
            ),
            FooterLink(
              title: 'How tandala works',
            ),
            FooterLink(
              title: 'How to report a listing',
            )
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FooterSectionTitle(
              title: "Tourism",
            ),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            FooterLink(
              title: 'Best Zambia holiday destination',
            ),
            FooterLink(
              title: 'Traditional ceremonies',
            ),
            FooterLink(
              title: 'Victoria falls guide',
            )
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FooterSectionTitle(
              title: "Legal",
            ),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            FooterLink(
              title: 'Terms and conditions',
            ),
            FooterLink(
              title: 'Privacy policy',
            ),
            FooterLink(
              title: 'Contact',
            )
          ],
        ),
      ],
    );
  }
}