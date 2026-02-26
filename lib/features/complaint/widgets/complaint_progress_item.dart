import 'package:flutter/material.dart';
import 'package:polandesa/common/style/padding.dart';
import 'package:polandesa/utils/constants/colors.dart';
import 'package:polandesa/utils/constants/helpers/hex_color.dart';

class ComplaintProgressItem extends StatelessWidget {
  final String status;
  final String admin;
  final String date;
  final String description;

  const ComplaintProgressItem({
    super.key,
    required this.status,
    required this.admin,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Image.asset(
              "assets/icons/lingkaran-biru.jpeg",
              height: 25,
              width: 25,
            ),
            Container(width: 2, height: 140, color: UColors.grey),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 90,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor.fromHex("#f7f8fb"),
                    foregroundColor: HexColor.fromHex("#FF4158D0"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(status, style: const TextStyle(fontSize: 12)),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                admin,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 14,
                  color: UColors.darkGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100],
                ),
                child: Padding(
                  padding: UPadding.screenPadding,
                  child: Text(description),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
