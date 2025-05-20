import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../../../common/widgets/layouts/sidebars/sidebar.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../controllers/menu_visibility_controller.dart';


class AnimatedDrawer extends StatefulWidget {
  final Widget? child;

  AnimatedDrawer({super.key, this.child});

  static AnimatedDrawerState of(BuildContext context) =>
      context.findAncestorStateOfType<AnimatedDrawerState>()!;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  AnimatedDrawerState createState() => AnimatedDrawerState();
}

class AnimatedDrawerState extends State<AnimatedDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> curvedAnimation;
  bool _canBeDragged = false;
  final double maxSlide = 300.0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOutQuad,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void toggle() =>
      animationController.isDismissed
          ? animationController.forward()
          : animationController.reverse();

  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(MenuVisibilityController());
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      behavior: HitTestBehavior.translucent,
      onTap: toggle,
      child: AnimatedBuilder(
        animation: curvedAnimation,
        builder: (context, _) {
          return Material(
            color: TColors.primaryBackground,
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(maxSlide * (curvedAnimation.value - 1), 0),
                  child: Transform(
                    transform:
                        Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(math.pi / 2 * (1 - curvedAnimation.value)),
                    alignment: Alignment.centerRight,
                    child: VisibilityDetector(
                      key: const Key('sidebar-key'),
                      onVisibilityChanged: (VisibilityInfo info) {
                        // Update menu icon visibility based on header visibility
                        menuController.menuIconVisible.value =
                            info.visibleFraction > 0.0;
                      },
                      child: const TSidebar(),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(maxSlide * curvedAnimation.value, 0),
                  child: Transform(
                    transform:
                        Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(-math.pi * curvedAnimation.value / 2),
                    alignment: Alignment.centerLeft,
                    child: widget.child,
                  ),
                ),

                Obx(() {
                  return menuController.menuIconVisible.value
                      ? Positioned(
                        top: 11.0 + MediaQuery.of(context).padding.top,
                        left: 4.0 + curvedAnimation.value * maxSlide,
                        child: IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: toggle,
                          color: TColorSystem.primary100,
                        ),
                      )
                      : const SizedBox.shrink(); // Return empty widget when not visible
                }),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = animationController.isDismissed;
    bool isDragCloseFromRight = animationController.isCompleted;
    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta! / maxSlide;
      animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    const double kMinFlingVelocity = 365.0;

    if (animationController.isDismissed || animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= kMinFlingVelocity) {
      double visualVelocity =
          details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      animationController.fling(velocity: visualVelocity);
    } else if (animationController.value < 0.5) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }
}
