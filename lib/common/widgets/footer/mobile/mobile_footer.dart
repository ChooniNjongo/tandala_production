import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../desktop/footer_link_text.dart';
import '../desktop/footer_link_title.dart';

class MobileFooter extends StatelessWidget {
  const MobileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 3,
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                /// Tandala Links
                children: [
                  FooterSectionTitle(
                    title: TTexts.tandalaFooterSection,
                  ),
                  FooterLink(title: TTexts.tandalaFooterLink1),
                  FooterLink(title: TTexts.tandalaFooterLink2),
                  FooterLink(title: TTexts.tandalaFooterLink3),
                ],
              )),
              Expanded(
                flex: 2,
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                /// Tourism Links
                children: [
                  FooterSectionTitle(
                    title: TTexts.tourismFooterSection,
                  ),
                  FooterLink(title: TTexts.tourismFooterLink1),
                  FooterLink(title: TTexts.tourismFooterLink2),
                  FooterLink(title: TTexts.tourismFooterLink3),
                  FooterLink(title: TTexts.tourismFooterLink4),
                ],
              )),
            ],
          ),
          SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                /// Categories Links
                children: [
                  FooterSectionTitle(
                    title: TTexts.categoriesFooterSection,
                  ),
                  FooterLink(title: TTexts.categoriesFooterLink1),
                  FooterLink(title: TTexts.categoriesFooterLink2),
                  FooterLink(title: TTexts.categoriesFooterLink3),
                ],
              )),
              Expanded(
                  flex: 2,
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                /// Legal Links
                children: [
                  FooterSectionTitle(
                    title: TTexts.legalFooterSection,
                  ),
                  FooterLink(title: TTexts.legalFooterLink1),
                  FooterLink(title: TTexts.legalFooterLink2),
                  FooterLink(title: TTexts.legalFooterLink3),
                ],
              )),
            ],
          ),
        ],
      ),
    );
  }
}
