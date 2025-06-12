// pagination_navigation.dart
import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/typography.dart';

class PaginationNavigation extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onPageChanged;
  final int maxVisiblePages;

  const PaginationNavigation({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    this.maxVisiblePages = 5,
  });

  List<int> _getVisiblePages() {
    if (totalPages <= maxVisiblePages) {
      return List.generate(totalPages, (index) => index + 1);
    }

    // Calculate the range of pages to show
    int start = (currentPage - maxVisiblePages ~/ 2).clamp(1, totalPages - maxVisiblePages + 1);
    int end = (start + maxVisiblePages - 1).clamp(1, totalPages);

    // Adjust start if we're near the end
    if (end == totalPages) {
      start = (totalPages - maxVisiblePages + 1).clamp(1, totalPages);
    }

    return List.generate(end - start + 1, (index) => start + index);
  }

  @override
  Widget build(BuildContext context) {
    if (totalPages <= 1) return const SizedBox.shrink();

    final visiblePages = _getVisiblePages();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Previous Arrow
          _PaginationButton(
              onTap: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
              child: SvgPicture.asset(
                "assets/icons/pagination/chevron-left.svg",
                width: 20,
                height: 20,
              )
          ),

          const SizedBox(width: 8),

          // First page if not visible
          if (visiblePages.first > 1) ...[
            _PaginationNumberButton(
              pageNumber: 1,
              isSelected: currentPage == 1,
              onTap: () => onPageChanged(1),
            ),
            if (visiblePages.first > 2) _buildEllipsis(),
          ],

          // Visible page numbers
          ...visiblePages.map((pageNumber) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: _PaginationNumberButton(
              pageNumber: pageNumber,
              isSelected: currentPage == pageNumber,
              onTap: () => onPageChanged(pageNumber),
            ),
          )),

          // Last page if not visible
          if (visiblePages.last < totalPages) ...[
            if (visiblePages.last < totalPages - 1) _buildEllipsis(),
            _PaginationNumberButton(
              pageNumber: totalPages,
              isSelected: currentPage == totalPages,
              onTap: () => onPageChanged(totalPages),
            ),
          ],

          const SizedBox(width: 8),

          // Next Arrow
          _PaginationButton(
              onTap: currentPage < totalPages ? () => onPageChanged(currentPage + 1) : null,
              child: SvgPicture.asset(
                  "assets/icons/pagination/chevron-right.svg",
                  color: TColors.textPrimary,
                  width: 20,
                  height: 20
              )
          ),
        ],
      ),
    );
  }

  Widget _buildEllipsis() {
    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      child: Text(
        '...',
        style: TTypography.body12Regular.apply(
          color: TColorSystem.n300,
        ),
      ),
    );
  }
}

class _PaginationButton extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget child;

  const _PaginationButton({
    required this.onTap,
    required this.child,
  });

  @override
  State<_PaginationButton> createState() => _PaginationButtonState();
}

class _PaginationButtonState extends State<_PaginationButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(8),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: widget.onTap != null && isHovered
                  ? TColorSystem.primary500.withOpacity(0.1)
                  : Colors.transparent,
            ),
            child: Center(child: widget.child),
          ),
        ),
      ),
    );
  }
}

class _PaginationNumberButton extends StatefulWidget {
  final int pageNumber;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaginationNumberButton({
    required this.pageNumber,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_PaginationNumberButton> createState() => _PaginationNumberButtonState();
}

class _PaginationNumberButtonState extends State<_PaginationNumberButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(16), // Perfect circle for all states
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: (widget.isSelected || isHovered)
                  ? BorderRadius.circular(16) // Perfect circle for selected or hovered
                  : BorderRadius.circular(6), // Rounded rectangle for default state
              color: widget.isSelected
                  ? TColorSystem.primary500
                  : (isHovered ? TColorSystem.primary500.withOpacity(0.1) : Colors.transparent),
            ),
            child: Center(
              child: Text(
                '${widget.pageNumber}',
                style: TTypography.body14Regular.apply(
                  color: widget.isSelected
                      ? Colors.white
                      : (isHovered ? TColorSystem.primary500 : TColors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}