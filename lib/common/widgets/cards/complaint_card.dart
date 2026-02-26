// lib/features/complaints/widgets/u_complaint_card.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polandesa/utils/constants/colors.dart';
import 'package:polandesa/utils/constants/helpers/hex_color.dart';

class UComplaintCard extends StatelessWidget {
  final Map<String, String> complaint;
  final VoidCallback onTap;

  const UComplaintCard({
    super.key,
    required this.complaint,
    required this.onTap,
  });

  Color getStatusColor(String status) {
    switch (status) {
      case "Disposisi":
        return UColors.backgroundColor;
      case "Progres":
        return HexColor.fromHex("#fcb900");
      case "Selesai":
        return HexColor.fromHex("#E5F9F2");
      case "Verifikasi":
        return HexColor.fromHex("#8ed1fc");
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: UColors.white,
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/complaints/aduan.png",
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      complaint["kode"]!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: HexColor.fromHex("#020381"),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      complaint["deskripsi"]!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: UColors.dark,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      complaint["tanggal"]!,
                      style: TextStyle(
                        color: UColors.darkGrey,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 90,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  getStatusColor(complaint["status"]!),
                              foregroundColor: HexColor.fromHex("#FF4158D0"),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(
                              complaint["status"]!,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.bookmark_outline_rounded,
                          size: 30,
                          color: HexColor.fromHex("#FF4158D0"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}