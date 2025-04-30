import 'package:flutter/material.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    super.key,
    this.currencySign = 'K',
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,  this.color = Colors.black,
  });

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.bodyMedium!.apply(color: color,
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(color: color,
              decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
