import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polandesa/common/widgets/cards/complaint_card.dart';
import 'package:polandesa/features/complaint/data/complaints.dart';
import 'package:polandesa/features/complaint/detail_complaint.dart';
import 'package:polandesa/utils/constants/colors.dart';

class ListComplaintScreen extends StatelessWidget {
  const ListComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Aduan Masyarakat",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: complaints.length,
        itemBuilder: (context, index) {
          final item = complaints[index];
          return UComplaintCard(
            complaint: item,
            onTap: () => Get.to(() => DetailComplaintScreen()),
          );
        },
      ),
    );
  }
}
