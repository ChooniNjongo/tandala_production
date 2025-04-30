import 'package:flutter/material.dart';
import '../../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../../utils/constants/colors.dart';

class ImportantCountTile extends StatelessWidget {
  const ImportantCountTile({
    super.key,
    required this.count,
    required this.isSelected,
    required this.onTap,
    required this.radius,
  });

  final String count;
  final bool isSelected;
  final void Function() onTap;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: EdgeInsets.zero,
        radius: radius,
        backgroundColor: isSelected ? TColors.white : TColors.jetBlack,
        showBorder: false,
        showShadow: isSelected ? true : false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Text(
            count,
            style: Theme.of(context).textTheme.headlineSmall!.apply(
                color: isSelected ? TColors.jetBlack : TColors.white,
                fontSizeFactor: isSelected ? 0.8 : 0.76),
          ),
        ),
      ),
    );
  }
}
