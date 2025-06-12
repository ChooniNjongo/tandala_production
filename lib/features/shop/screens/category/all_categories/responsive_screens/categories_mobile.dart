import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../common/widgets/loaders/loader_animation.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/category/city_or_town_controller.dart';
import '../table/data_table.dart';
import '../widgets/table_header.dart';

class CategoriesMobileScreen extends StatelessWidget {
  const CategoriesMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CityOrTownController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpaceDesktop),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBreadcrumbsWithHeading(heading: 'Categories', breadcrumbItems: ['Categories']),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Table Body
              Obx(() {
                if (controller.isLoading.value) return const TLoaderAnimation();
                return const TRoundedContainer(
                  child: Column(
                    children: [
                      // Table Header
                      CategoryTableHeader(),
                      SizedBox(height: TSizes.spaceBtwItems),

                      // Table
                      CategoryTable(),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
