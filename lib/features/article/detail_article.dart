import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:polandesa/utils/constants/colors.dart';

class DetailArticleScreen extends StatelessWidget {
  const DetailArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> artikelImages = [
      "assets/images/artikel/artikel-10.jpg",
      "assets/images/artikel/artikel-11.jpg",
      "assets/images/artikel/artikel-12.jpg",
    ];

    return Scaffold(
      backgroundColor: UColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Image.asset("assets/icons/share.png", height: 35, width: 35),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sikapi Dampak Opsen dari Pemerintah Pusat, Pemprov Jateng Berlakukan Pengurangan Pajak Kendaraan Bermotor",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 6),
              Text(
                "21 Februari 2026",
                style: TextStyle(fontSize: 14, color: Colors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/artikel/artikel-9.jpg",
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.bookmark,
                      color: const Color.fromARGB(255, 185, 185, 185),
                      size: 30,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "SEMARANG - ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:
                                "Menyikapi kenaikan pajak kendaraan bermotor (PKB) sebagai dampak kebijakan opsen dari pemerintah pusat, Pemerintah Provinsi Jawa Tengah resmi meluncurkan kebijakan pengurangan PKB 2026.\n\n",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[900],
                            ),
                          ),
                          TextSpan(
                            text:
                                "Pelaksana Tugas (Plt) Kepala Badan Pengelola Pendapatan Daerah (Bapenda) Jawa Tengah, Muhamad Masrofi, menjelaskan, kebijakan tersebut tertuang dalam Keputusan Gubernur Jawa Tengah Nomor 100.3.3.1/43 Tahun 2026 tanggal 20 Februari 2026 tentang Pemberian Pengurangan atas Pajak Kendaraan Bermotor.",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[900],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              ...artikelImages
                  .map(
                    (path) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          path,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
