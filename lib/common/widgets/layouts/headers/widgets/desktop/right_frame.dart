import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../features/booking/screens/home/widgets/desktop/notification_count.dart';
import '../../../../../../utils/constants/image_strings.dart';
import 'notification_icon.dart';
import 'popup_menu_widget.dart';

class RightFrame extends StatefulWidget {
  const RightFrame({super.key});

  @override
  State<RightFrame> createState() => _RightFrameState();
}

class _RightFrameState extends State<RightFrame> {
  bool _isMenuVisible = false;
  OverlayEntry? _overlayEntry;

  void _toggleMenu() {
    if (_isMenuVisible) {
      _hideMenu();
    } else {
      _showMenu();
    }
  }

  void _showMenu() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isMenuVisible = true;
    });
  }

  void _hideMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isMenuVisible = false;
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: _hideMenu,
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              // Transparent background to catch clicks
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.transparent,
              ),
              // Menu positioned so its right edge aligns with the menu icon's right edge
              Positioned(
                top: offset.dy + size.height + 8, // 8px below the header
                right: MediaQuery.of(context).size.width - offset.dx - size.width, // Align right edge with menu icon's right edge
                child: PopupMenuWidget(
                  onItemTap: (String item) {
                    _hideMenu();
                    _handleMenuItemTap(item);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _hideMenu();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildListPropertyButton(),
        _buildBookingsButton(),
        TNotificationIcon(onTap: () {
          if (_isMenuVisible) _hideMenu();
        }),
        const SizedBox(width: 12),
        _buildUnionButton(),
        const SizedBox(width: 12),
        _buildProfileImage(),
        const SizedBox(width: 24),
        _buildMenuButton(),
      ],
    );
  }

  Widget _buildListPropertyButton() {
    return GestureDetector(
      onTap: () {
        if (_isMenuVisible) _hideMenu();
        print("List Your Property clicked");
        // Add your navigation or action logic
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              SvgPicture.asset(TImages.plus),
              const SizedBox(width: 8),
              const Text(
                "List Your Property",
                style: TextStyle(
                  color: TColors.textPrimary,
                  fontFamily: 'InterDisplay',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 1.4,
                  letterSpacing: 0.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookingsButton() {
    return GestureDetector(
      onTap: () {
        if (_isMenuVisible) _hideMenu();
        print("Bookings clicked");
        // Add your navigation or action logic
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Row(
            children: [
              SvgPicture.asset(TImages.bookings),
              const SizedBox(width: 8),
              const Text(
                "Bookings",
                style: TextStyle(
                  fontFamily: 'InterDisplay',
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                  letterSpacing: 0.0,
                  fontSize: 14,
                  color: TColors.textPrimary,
                ),
              ),
              const SizedBox(width: 3),
              const NotificationCountWidget(
                count: 2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUnionButton() {
    return GestureDetector(
      onTap: () {
        if (_isMenuVisible) _hideMenu();
        print("Union icon clicked");
        // Add your navigation or action logic
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: SvgPicture.asset(TImages.union),
      ),
    );
  }

  Widget _buildProfileImage() {
    return GestureDetector(
      onTap: () {
        if (_isMenuVisible) _hideMenu();
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton() {
    return GestureDetector(
      onTap: _toggleMenu,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: _isMenuVisible
              ? BoxDecoration(
            shape: BoxShape.circle, // Makes the container circular
             color: TColors.textPrimary.withOpacity(0.1),
          )
              : const BoxDecoration(
            shape: BoxShape.circle, // Keep circular shape even when not visible
          ),
          child: SvgPicture.asset(TImages.menu),
        ),
      ),
    );
  }

  void _handleMenuItemTap(String item) {
    switch (item) {
      case 'Home':
        print("Navigating to Home");
        break;
      case 'Bookings':
        print("Navigating to Bookings");
        break;
      case 'Messages':
        print("Navigating to Messages");
        break;
      case 'Account':
        print("Navigating to Account");
        break;
      case 'Listings':
        print("Navigating to Listings");
        break;
      case 'Favourites':
        print("Navigating to Favourites");
        break;
      case 'Reviews':
        print("Navigating to Reviews");
        break;
      case 'Listing Reports':
        print("Navigating to Listing Reports");
        break;
      case 'Send Suggestion':
        print("Opening Send Suggestion");
        break;
      case 'Get Help':
        print("Opening Get Help");
        break;
    }
  }
}