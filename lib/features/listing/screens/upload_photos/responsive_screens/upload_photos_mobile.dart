import 'package:flutter/material.dart';

import '../widgets/body.dart';
import '../widgets/upload_photo_bottom_navigation_bar.dart';

class UploadPhotosMobileScreen extends StatelessWidget {
  const UploadPhotosMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UploadPhotosBody(),
      bottomNavigationBar:UploadPhotoBottomNavigationBar(),
    );
  }
}
