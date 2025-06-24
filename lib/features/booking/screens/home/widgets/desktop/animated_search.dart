import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SimpleSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final VoidCallback? onSearchTap;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  const SimpleSearchBar({
    super.key,
    this.controller,
    this.hintText,
    this.onSearchTap,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      width: 655.2,
      decoration: BoxDecoration(
        color: const Color(0xFF1A2323).withOpacity(0.75),
        borderRadius: BorderRadius.circular(37.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Three text widgets with dividers
          Positioned(
            left: 20,
            right: 80,
            top: 0,
            bottom: 0,
            child: Row(
              children: [
                // First text widget
                Expanded(
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          onTap: () {
                            // Handle Where to tap
                            print('Where to tapped');
                          },
                          borderRadius: BorderRadius.circular(8),
                          hoverColor: TColors.primary.withOpacity(0.1),
                          splashColor: TColors.primary.withOpacity(0.2),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            alignment: Alignment.center,
                            child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Where to?',
                                  style: TextStyle(
                                    fontFamily: 'InterDisplay',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    height: 1.3,
                                    letterSpacing: 0,
                                    color: Color(0xFF888888),
                                  ),
                                ),
                                Text(
                                  'Search destinations',
                                  style: TextStyle(
                                    fontFamily: 'InterDisplay',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    height: 1.4,
                                    letterSpacing: 0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // First divider
                Container(
                  width: 3.2,
                  height: 48,
                  color: const Color(0xFF001113),
                ),

                // Second text widget
                Expanded(
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          onTap: () {
                            // Handle When tap
                            print('When tapped');
                          },
                          borderRadius: BorderRadius.circular(8),
                          hoverColor: TColors.primary.withOpacity(0.1),
                          splashColor: TColors.primary.withOpacity(0.2),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            alignment: Alignment.center,
                            child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'When ?',
                                  style: TextStyle(
                                    fontFamily: 'InterDisplay',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    height: 1.3,
                                    letterSpacing: 0,
                                    color: Color(0xFF888888),
                                  ),
                                ),
                                Text(
                                  'Add dates',
                                  style: TextStyle(
                                    fontFamily: 'InterDisplay',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    height: 1.4,
                                    letterSpacing: 0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Second divider
                Container(
                  width: 3.2,
                  height: 48,
                  color: const Color(0xFF001113),
                ),

                // Third text widget
                Expanded(
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          onTap: () {
                            // Handle With who tap
                            print('With who tapped');
                          },
                          borderRadius: BorderRadius.circular(8),
                          hoverColor: TColors.primary.withOpacity(0.1),
                          splashColor: TColors.primary.withOpacity(0.2),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            alignment: Alignment.center,
                            child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'With who?',
                                  style: TextStyle(
                                    fontFamily: 'InterDisplay',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    height: 1.3,
                                    letterSpacing: 0,
                                    color: Color(0xFF888888),
                                  ),
                                ),
                                Text(
                                  'Add guests',
                                  style: TextStyle(
                                    fontFamily: 'InterDisplay',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    height: 1.4,
                                    letterSpacing: 0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Search icon - positioned at the right
          Positioned(
            right: 17.5,
            top: 17.5,
            child: GestureDetector(
              onTap: onSearchTap,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: TColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}