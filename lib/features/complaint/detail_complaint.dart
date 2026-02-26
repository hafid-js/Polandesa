import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:polandesa/features/complaint/widgets/complaint_progress_item.dart';
import 'package:polandesa/utils/constants/colors.dart';
import 'package:polandesa/utils/constants/helpers/hex_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailComplaintScreen extends StatefulWidget {
  const DetailComplaintScreen({super.key});

  @override
  State<DetailComplaintScreen> createState() => _DetailComplaintScreenState();
}

class _DetailComplaintScreenState extends State<DetailComplaintScreen> {
  int _currentIndex = 0;

  final List<String> sliderItems = [
    "assets/images/artikel/artikel-3.jpg",
    "assets/images/artikel/artikel-3.jpg",
    "assets/images/artikel/artikel-3.jpg",
  ];

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
          "Detail Aduan",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: UColors.white,
              height: 280,
              child: Stack(
                children: [
                  CarouselSlider(
                    items: sliderItems
                        .map(
                          (imagePath) => Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                      height: 230,
                      viewportFraction: 1.0,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),

                  Positioned(
                    bottom: 60,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: AnimatedSmoothIndicator(
                        activeIndex: _currentIndex,
                        count: sliderItems.length,
                        effect: ExpandingDotsEffect(
                          dotHeight: 14,
                          dotWidth: 20,
                          activeDotColor: HexColor.fromHex("#ff6900"),
                          dotColor: UColors.white.withAlpha(6),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 18,
                    left: 18,
                    right: 18,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "LGIG21192729",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,

                            color: Color.fromRGBO(65, 88, 208, 100),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "21 Februari 2026 06:01",
                          style: TextStyle(
                            fontSize: 13,
                            color: UColors.darkGrey,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8),

            Container(
              color: UColors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 18,
                  right: 18,
                  bottom: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  content: Text("Uji Coba"),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: UColors.backgroundColor,
                              foregroundColor: HexColor.fromHex("#FF4158D0"),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            child: const Text(
                              "Disposisi",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Icon(Icons.bookmark, size: 30, color: UColors.darkGrey),
                      ],
                    ),

                    SizedBox(height: 20),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Laporan",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 6),
                        Text(
                          "tgl 12 februari 2026 di jalan Pandanaran kota semarang ini bagaimana jalan di buat tempat parkir padahal ada tanda di larang parkir , gimana Semarang mau tertib lalu lintas kalau masih ada oknum2 yg membiarkan parkir begini .. dishub dimana itu ???",
                        ),
                        SizedBox(height: 14),
                        Text(
                          "Kategori",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 6),
                        Text(
                          "INFRASTRUKTUR",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 14),
                        Text(
                          "Lokasi",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 6),
                        Text(
                          "KABUPATEN PURWOREJO",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 8),

            Container(
              color: UColors.white,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 14,
                  bottom: 60,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Progres",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 10),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ComplaintProgressItem(
                              status: "Disposisi",
                              admin: "AMIN GUBERNURAN",
                              date: "21 Februari 2026 06:11",
                              description:
                                  "Laporan telah diteruskan ke Balai Besar Pelaksanaan Jalan Besar Nasional Jawa Tengah & DIY",
                            ),
                            SizedBox(height: 12),
                            ComplaintProgressItem(
                              status: "Verifikasi",
                              admin: "AMIN GUBERNURAN",
                              date: "21 Februari 2026 06:11",
                              description:
                                  "Laporan telah diteruskan ke Balai Besar Pelaksanaan Jalan Besar Nasional Jawa Tengah & DIY",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
