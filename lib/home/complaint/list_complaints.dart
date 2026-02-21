import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polandesa/utils/constants/colors.dart';
import 'package:polandesa/utils/constants/helpers/hex_color.dart';

class ListComplaintScren extends StatelessWidget {
  const ListComplaintScren({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> complaints = [
      {
        "kode": "LGIG21192729",
        "deskripsi":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
        "tanggal": "Purworejo, 8 jam yang lalu",
      },
      {
        "kode": "LGIG21192730",
        "deskripsi":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
        "tanggal": "Purworejo, 10 jam yang lalu",
      },
      {
        "kode": "LGIG21192730",
        "deskripsi":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
        "tanggal": "Purworejo, 10 jam yang lalu",
      },
      {
        "kode": "LGIG21192730",
        "deskripsi":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
        "tanggal": "Purworejo, 10 jam yang lalu",
      },
      {
        "kode": "LGIG21192730",
        "deskripsi":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
        "tanggal": "Purworejo, 10 jam yang lalu",
      },
      {
        "kode": "LGIG21192730",
        "deskripsi":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
        "tanggal": "Purworejo, 10 jam yang lalu",
      },
      {
        "kode": "LGIG21192730",
        "deskripsi":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
        "tanggal": "Purworejo, 10 jam yang lalu",
      },
      {
        "kode": "LGIG21192730",
        "deskripsi":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
        "tanggal": "Purworejo, 10 jam yang lalu",
      },
    ];

    return Scaffold(
      backgroundColor: HexColor.fromHex("#f7f8fb"),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Aduan Masyarkat",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          child: Column(
            children: complaints.map((item) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Card(
                  color: UColors.white,
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 6, right: 6, top: 10, bottom: 15),
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
                                item["kode"]!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: HexColor.fromHex("#020381"),
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 5),

                              Text(
                                item["deskripsi"]!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: UColors.dark,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 5),

                              Text(
                                item["tanggal"]!,
                                style: TextStyle(
                                  color: UColors.darkGrey,
                                  fontSize: 11,
                                ),
                              ),
                              const SizedBox(height: 20),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 90,
                                    height: 30,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => const AlertDialog(
                                            title: Text("Informasi"),
                                            content: Text(
                                                "Uji Coba"),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            HexColor.fromHex("#f7f8fb"),
                                        foregroundColor:
                                            HexColor.fromHex("#FF4158D0"),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: const Text(
                                        "Disposisi",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.bookmark_outline_rounded,
                                    size: 30,
                                    color:
                                        HexColor.fromHex("#FF4158D0"),
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
            }).toList(),
          ),
        ),
      ),
    );
  }
}