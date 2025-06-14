import 'dart:async';
import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AnimatedSearchBarWithTyping extends StatefulWidget {
  const AnimatedSearchBarWithTyping({super.key});

  @override
  State<AnimatedSearchBarWithTyping> createState() =>
      _AnimatedSearchBarWithTypingState();
}

class _AnimatedSearchBarWithTypingState
    extends State<AnimatedSearchBarWithTyping>
    with TickerProviderStateMixin {
  late AnimationController _expansionController;
  late AnimationController _textWidgetsController;
  late Animation<double> _widthAnimation;
  late Animation<double> _iconSlideAnimation;
  late Animation<double> _textOpacityAnimation;
  late Animation<double> _textWidgetsFadeAnimation;
  late Animation<double> _textWidgetsSlideAnimation;

  bool _isExpanded = false;
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  // Typing animation variables
  final String _targetText = "Lusaka";
  String _currentText = "";
  int _currentIndex = 0;
  Timer? _typingTimer;
  bool _isTyping = false;
  bool _showTextWidgets = false;

  @override
  void initState() {
    super.initState();

    _expansionController = AnimationController(
      duration: const Duration(milliseconds: 1400),
      vsync: this,
    );

    _textWidgetsController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Container width animation
    _widthAnimation = Tween<double>(
      begin: 70.0,
      end: 655.2, // Increased by 30% (504 * 1.3 = 655.2)
    ).animate(
      CurvedAnimation(parent: _expansionController, curve: Curves.easeOutCubic),
    );

    // Icon slide animation - starts immediately with container expansion
    _iconSlideAnimation = Tween<double>(
      begin: 15.0, // Start position (15px from left)
      end: 600.2, // End position (655.2 - 40 - 15 = 600.2px from left)
    ).animate(
      CurvedAnimation(parent: _expansionController, curve: Curves.easeOutSine),
    );

    // Text opacity animation
    _textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _expansionController,
        curve: const Interval(0.4, 1.0, curve: Curves.easeIn),
      ),
    );

    // Text widgets fade animation
    _textWidgetsFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textWidgetsController, curve: Curves.easeInOut),
    );

    // Text widgets slide animation (subtle upward slide)
    _textWidgetsSlideAnimation = Tween<double>(
      begin: 20.0, // Start 20px below
      end: 0.0, // End at normal position
    ).animate(
      CurvedAnimation(
        parent: _textWidgetsController,
        curve: Curves.easeOutQuart,
      ),
    );

    // Listen for expansion animation completion
    _expansionController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _startTypingAnimation();
      }
    });

    // Auto-start animation after the UI finishes building
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          _isExpanded = true;
        });
        _expansionController.forward();
      });
    });
  }

  void _startTypingAnimation() {
    // Focus the text field first
    _focusNode.requestFocus();

    // Wait a moment before starting to type
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isTyping = true;
        _currentIndex = 0;
        _currentText = "";
      });

      _typingTimer = Timer.periodic(const Duration(milliseconds: 250), (timer) {
        if (_currentIndex < _targetText.length) {
          setState(() {
            _currentIndex++;
            _currentText = _targetText.substring(0, _currentIndex);
            _textController.text = _currentText;
            _textController.selection = TextSelection.fromPosition(
              TextPosition(offset: _currentText.length),
            );
          });
        } else {
          _typingTimer?.cancel();
          setState(() {
            _isTyping = false;
          });
          // Show the three text widgets after typing completes
          Future.delayed(const Duration(milliseconds: 500), () {
            setState(() {
              _showTextWidgets = true;
            });
            // Start the text widgets animation
            _textWidgetsController.forward();
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _expansionController.dispose();
    _textWidgetsController.dispose();
    _typingTimer?.cancel();
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _toggleSearchBar() {
    if (_isExpanded) {
      // Reset everything
      _typingTimer?.cancel();
      setState(() {
        _isExpanded = false;
        _isTyping = false;
        _currentIndex = 0;
        _currentText = "";
        _showTextWidgets = false;
      });
      _expansionController.reverse();
      _textWidgetsController.reset();
      _focusNode.unfocus();
      _textController.clear();
    } else {
      setState(() {
        _isExpanded = true;
      });
      _expansionController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _expansionController,
      builder: (context, child) {
        return Container(
          height: 75.0, // Increased height from 65 to 75
          width: _widthAnimation.value,
          decoration: BoxDecoration(
            color: const Color(0xFF1A2323).withOpacity(0.4),
            borderRadius: BorderRadius.circular(
              37.5,
            ), // Adjusted for new height (75/2)
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
              // Text field - completely borderless
              if (_isExpanded && !_showTextWidgets)
                Positioned(
                  left: 40, // Moved from 25 to 40 (15px more to the right)
                  right: 80,
                  top: 17.5, // Same as icon top position
                  height: 40, // Same as icon height
                  child: Opacity(
                    opacity: _textOpacityAnimation.value,
                    child: TextField(
                      controller: _textController,
                      focusNode: _focusNode,
                      readOnly: _isTyping,
                      decoration: InputDecoration(
                        hintText: _currentText.isEmpty && !_isTyping
                            ? 'Search...'
                            : null,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ), // Center within 40px height
                        hintStyle:            TextStyle(
                        fontFamily: 'InterDisplay',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        height: 1.4, // 140% line height
                        letterSpacing: 0,
                        color:  const Color(0xFF888888),
                      ),
                      ),
                      style: TextStyle(
                        fontFamily: 'InterDisplay',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        height: 1.4, // 140% line height
                        letterSpacing: 0,
                        color:  const Color(0xFF888888),
                      ),
                    ),
                  ),
                ),

              // Three text widgets with dividers - animated
              if (_showTextWidgets)
                Positioned(
                  left: 20,
                  right: 80,
                  top: 0,
                  bottom: 0,
                  child: AnimatedBuilder(
                    animation: _textWidgetsController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _textWidgetsSlideAnimation.value),
                        child: Opacity(
                          opacity: _textWidgetsFadeAnimation.value,
                          child: Row(
                            children: [
                              // First text widget
                              Expanded(
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Material(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(8),
                                    child: InkWell(
                                      onTap: () {
                                        // Handle Hotels tap
                                        print('Hotels tapped');
                                      },
                                      borderRadius: BorderRadius.circular(8),
                                      hoverColor: Colors.blue.withOpacity(0.1),
                                      splashColor: Colors.blue.withOpacity(0.2),
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        alignment: Alignment.center,
                                        child: const Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Where are you going?',
                                              style: TextStyle(
                                                fontFamily: 'InterDisplay',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                height: 1.3, // 140% line height
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
                                                height: 1.4, // 140% line height
                                                letterSpacing: 0,
                                                color:  Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // First divider
                              Container(
                                width: 1,
                                height: 40,
                                color: Colors.white54,
                              ),

                              // Second text widget
                              Expanded(
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Material(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(8),
                                    child: InkWell(
                                      onTap: () {
                                        // Handle Restaurants tap
                                        print('Restaurants tapped');
                                      },
                                      borderRadius: BorderRadius.circular(8),
                                      hoverColor: Colors.blue.withOpacity(0.1),
                                      splashColor: Colors.blue.withOpacity(0.2),
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        alignment: Alignment.center,
                                        child: const Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'When are you travelling?',
                                              style: TextStyle(
                                                fontFamily: 'InterDisplay',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                height: 1.3, // 140% line height
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
                                                height: 1.4, // 140% line height
                                                letterSpacing: 0,
                                                color:  Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),

                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // Second divider
                              Container(
                                width: 1,
                                height: 40,
                                color: Colors.white54,
                              ),

                              // Third text widget
                              Expanded(
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Material(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(8),
                                    child: InkWell(
                                      onTap: () {
                                        // Handle Activities tap
                                        print('Activities tapped');
                                      },
                                      borderRadius: BorderRadius.circular(8),
                                      hoverColor: Colors.blue.withOpacity(0.1),
                                      splashColor: Colors.blue.withOpacity(0.2),
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        alignment: Alignment.center,
                                        child: const Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Who are you going with?',
                                              style: TextStyle(
                                                fontFamily: 'InterDisplay',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                height: 1.3, // 140% line height
                                                letterSpacing: 0,
                                                color:  Color(0xFF888888),
                                              ),
                                            ),
                                            Text(
                                              'Add guests',
                                              style: TextStyle(
                                                fontFamily: 'InterDisplay',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                height: 1.4, // 140% line height
                                                letterSpacing: 0,
                                                color:  Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

              // Search icon with absolute positioning
              Positioned(
                left: _iconSlideAnimation.value,
                top: 17.5, // Adjusted for new height (75-40)/2 = 17.5
                child: GestureDetector(
                  onTap: _toggleSearchBar,
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
      },
    );
  }
}