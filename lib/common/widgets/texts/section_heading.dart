import 'package:flutter/material.dart';
import 'package:polandesa/utils/constants/helpers/hex_color.dart';

class USectionHeading extends StatelessWidget {
  const USectionHeading({
    super.key,
    required this.title,
    this.buttonTitle,
    this.onPressed,
    this.showActionButton = true
  });

  final String title;
  final String? buttonTitle;
  final VoidCallback? onPressed;
  final bool showActionButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black), maxLines: 1, overflow: TextOverflow.ellipsis,
        ),
        if(showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle ?? '', style: TextStyle(color: HexColor.fromHex("#020381"), fontSize: 14),)),
      ],
    );
  }
}
