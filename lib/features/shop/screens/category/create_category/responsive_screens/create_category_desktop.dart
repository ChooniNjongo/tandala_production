import 'package:flutter/material.dart';

import '../../../../../../common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../widgets/create_category_form.dart';

class CreateCategoryDesktopScreen extends StatelessWidget {
  const CreateCategoryDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpaceDesktop),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrumbs
              TBreadcrumbsWithHeading(
                  returnToPreviousScreen: true, heading: 'Create Category', breadcrumbItems: [TRoutes.categories, 'Create Category']),
              SizedBox(height: TSizes.spaceBtwSections),

              // Form
              CreateCategoryForm(),
            ],
          ),
        ),
      ),
    );
  }
}
