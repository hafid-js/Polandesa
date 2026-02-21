import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polandesa/common/style/padding.dart';
import 'package:polandesa/common/widgets/texts/section_heading.dart';
import 'package:polandesa/home/complaint/list_complaints.dart';
import 'package:polandesa/utils/constants/colors.dart';
import 'package:polandesa/utils/constants/helpers/hex_color.dart';

class AduanScreen extends StatelessWidget {
  const AduanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor.fromHex("#f7f8fb"),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leadingWidth: 56,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: UPadding.detailCardPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Aduan Masyarakat",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: UColors.black,
                    ),
                  ),
                  Text(
                    "Sampaikan aduan seputar layanan atau fasilitas umum di Provinsi Jawa Tengah",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: UPadding.detailCardPadding,
            child: Column(
              children: [
                USectionHeading(title: "Lapor Aduan"),
                Card(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: SizedBox(
                    height: 240,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 20, top: 18),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons/kamera.png",
                                width: 35,
                                height: 35,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Lapor dengan Lampiran",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: UColors.dark,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Formulir aduan dengan melampirkan foto pendukung",
                                      style: TextStyle(
                                        color: UColors.darkGrey,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: UPadding.detailCardPadding,
                          child: const Divider(
                            height: 1,
                            color: UColors.grey,
                            thickness: 1,
                          ),
                        ),

                        SizedBox(height: 2),

                        Container(
                          padding: const EdgeInsets.only(left: 20, top: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons/telepon-2.png",
                                width: 35,
                                height: 35,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Telepon Via Internet",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: UColors.dark,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Telepon via internet secara gratis ke CS Jateng Nglakoni",
                                      style: TextStyle(
                                        color: UColors.darkGrey,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: UPadding.detailCardPadding,
                          child: const Divider(
                            height: 1,
                            color: UColors.grey,
                            thickness: 1,
                          ),
                        ),

                        SizedBox(height: 2),

                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons/telepon-3.png",
                                width: 35,
                                height: 35,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Telepon JNN 150945",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: UColors.dark,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Telepon berbayar (pulsa) ke CS Jateng Nglakoni",
                                      style: TextStyle(
                                        color: UColors.darkGrey,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: UColors.darkGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                USectionHeading(title: "Jelajahi Aduan"),

                Card(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: InkWell(
                      onTap: () => Get.to(ListComplaintScren()),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons/search-lampiran.png",
                                width: 35,
                                height: 35,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Lihat Aduan Masyarakat",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: UColors.dark,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    )
                  ),
                ),

                SizedBox(height: 20),
                Card(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons/list.png",
                                width: 35,
                                height: 35,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Laporan Saya",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: UColors.dark,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
