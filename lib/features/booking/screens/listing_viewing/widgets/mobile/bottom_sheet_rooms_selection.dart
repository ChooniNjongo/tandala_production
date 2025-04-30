import 'package:flutter/material.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../models/property/listing_model.dart';
import '../common/bottom_sheet_room_card.dart';
import '../desktop/web_scroll_behavior.dart';

class BottomSheetRoomsSelection extends StatefulWidget {
  const BottomSheetRoomsSelection({super.key, required this.listing});

  final ListingModel listing;

  @override
  State<BottomSheetRoomsSelection> createState() =>
      _BottomSheetRoomsSelectionState();
}

class _BottomSheetRoomsSelectionState extends State<BottomSheetRoomsSelection> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = TDeviceUtils.isMobileScreen(context);
    return TRoundedContainer(
      padding: EdgeInsets.zero,
      radius: 8,
      width: 1000,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:isMobile? 24:0),
        child: isMobile
            ? SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: widget.listing.rooms.map((room) {
              return BottomSheetRoomPreviewCard(room: room);
            }).toList(),
          ),
        )
            : ScrollConfiguration(
          behavior: WebScrollBehavior(),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 56),
              child: Row(
                children: widget.listing.rooms.map((room) {
                  return Container(
                    width: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: BottomSheetRoomPreviewCard(room: room),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

}


