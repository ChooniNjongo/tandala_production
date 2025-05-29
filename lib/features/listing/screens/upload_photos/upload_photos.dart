import 'package:cwt_ecommerce_admin_panel/features/listing/screens/upload_photos/responsive_screens/upload_photos_mobile.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../../../booking/screens/home/responsive_screens/home_tablet.dart';

class UploadPhotosScreen extends StatelessWidget {
  const UploadPhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const TSiteTemplate(
      useLayout: false,
      desktop: UploadPhotosMobileScreen(),
      tablet:  HomeTabletScreen(),
      mobile:  UploadPhotosMobileScreen(),
    );
  }
}
