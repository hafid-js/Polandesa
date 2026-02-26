import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polandesa/common/widgets/cards/complaint_card.dart';
import 'package:polandesa/features/complaint/data/complaints.dart';
import 'package:polandesa/features/complaint/detail_complaint.dart';
import 'package:polandesa/utils/constants/colors.dart';

class ListComplaintScreen extends StatefulWidget {
  const ListComplaintScreen({super.key});

  @override
  State<ListComplaintScreen> createState() => _ListComplaintScreenState();
}

class _ListComplaintScreenState extends State<ListComplaintScreen> {
  List<bool> savedStates = [];

  @override
  void initState() {
    super.initState();
    savedStates = List.generate(complaints.length, (_) => false);
  }

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
            isBookmarked: savedStates[index],
            onTap: () => Get.to(() => DetailComplaintScreen()),
            onBookmarkTap: () {
              setState(() {
                savedStates[index] = !savedStates[index];
              });
            },
          );
        },
      ),
    );
  }
}
