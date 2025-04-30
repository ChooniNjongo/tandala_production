import 'package:cwt_ecommerce_admin_panel/common/widgets/footer/desktop/social_links.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/color_system.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../containers/rounded_container.dart';
import 'download_app_prompt_footer.dart';
import 'footer_links.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
        radius: 0,
        height: 530,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 160),
          child: Column(
            children: [
              Divider(
                color: TColors.textSecondaryDark,
                thickness: 0.2,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections * 4,
              ),
              const FooterLinks(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              const SocialLinks(),
              const SizedBox(height: TSizes.spaceBtwSections),
              const DownloadAppPromptFooter(),
              const SizedBox(height: TSizes.spaceBtwSections),

              Text(
                '2024 © Tandala Tours Limited',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(fontSizeFactor: 0.75,color: TColorSystem.n300),
              )
            ],
          ),
        ));
  }
}
