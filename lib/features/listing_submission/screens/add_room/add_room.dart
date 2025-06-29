import 'package:cwt_ecommerce_admin_panel/features/listing_submission/screens/add_room/responsive_screens/add_room_mobile.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../../../booking/screens/home/responsive_screens/home_tablet.dart';

class AddRoomScreen extends StatelessWidget {
  const AddRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const TSiteTemplate(
      useLayout: false,
      desktop: AddRoomMobileScreen(),
      tablet:  HomeTabletScreen(),
      mobile:  AddRoomMobileScreen(),
    );
  }
}
