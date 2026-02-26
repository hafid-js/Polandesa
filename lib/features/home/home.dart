import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:polandesa/common/style/padding.dart';
import 'package:polandesa/common/widgets/images/circular_image.dart';
import 'package:polandesa/common/widgets/images/rounded_image.dart';
import 'package:polandesa/common/widgets/texts/section_heading.dart';
import 'package:polandesa/features/article/detail_article.dart';
import 'package:polandesa/features/home/data/article.dart';
import 'package:polandesa/features/home/data/events.dart';
import 'package:polandesa/features/home/data/menu_categories.dart';
import 'package:polandesa/features/home/data/menu_items.dart';
import 'package:polandesa/features/home/widgets/home_article_section.dart';
import 'package:polandesa/features/home/widgets/home_event_section.dart';
import 'package:polandesa/features/home/widgets/home_header.dart';
import 'package:polandesa/features/home/widgets/home_menu_grid.dart';
import 'package:polandesa/features/event/detail_event.dart';
import 'package:polandesa/utils/constants/colors.dart';
import 'package:polandesa/utils/constants/helpers/hex_color.dart';
import 'package:polandesa/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.backgroundColor,
      appBar: AppBar(toolbarHeight: -10),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(height: USizes.homePrimaryHeaderHeight + 10),
                HomeHeader(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Card(
                color: UColors.white,
                margin: EdgeInsets.all(12),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UCircularImage(
                        padding: 0,
                        isNetworkImage: false,
                        image: 'assets/icons/cs-support.png',
                        width: 47,
                        height: 47,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Call Center Ngopeni Ngapusi",
                              style: TextStyle(
                                color: HexColor.fromHex("#FF4158D0"),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 2),
                            Text(
                              "Telepon Call Center",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            HomeMenuGrid(menuItems: menuItems, menuCategories: menuCategories),
            SizedBox(height: 4),
            Padding(
              padding: UPadding.screenPadding,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: HexColor.fromHex("#4158D0"),
                      ),
                    ),

                    Positioned(
                      right: 0,
                      bottom: 12,
                      child: Image.asset(
                        "assets/icons/mobil.png",
                        height: 160,
                        fit: BoxFit.contain,
                      ),
                    ),

                    Positioned(
                      left: 16,
                      top: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.directions_bus,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  "PEDA MATENG",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 6),

                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Mudik Lebaran Gratis 2026",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(height: 4),

                                Text(
                                  "Provinsi Jawa Tengah",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),

                          SizedBox(
                            width: 100,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text("Informasi"),
                                    content: Text("Mudik Lebaran Gratis 2026"),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("Tutup"),
                                      ),
                                    ],
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
                              child: Center(
                                child: Text(
                                  "Cek Disini",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
              child: Column(
                children: [
                  USectionHeading(
                    title: "Beasiswa Santri dan Pengasuh",
                    buttonTitle: '',
                  ),
                  URoundedImage(
                    imageUrl: "assets/images/banners/banner-4.png",
                    isNetworkImage: false,
                  ),

                  SizedBox(height: 40),
                ],
              ),
            ),

            HomeEventSection(
              events: events,
              onTap: (item) => Get.to(() => DetailEventScreen()),
            ),

            SizedBox(height: 20),

            HomeArticleSection(
              events: articles,
              onTap: (item) => Get.to(() => DetailArticleScreen()),
            ),

            Container(
              color: const Color.fromARGB(176, 238, 238, 238),
              height: 115,
              width: MediaQuery.of(context).size.width,

              child: Padding(
                padding: const EdgeInsetsGeometry.symmetric(
                  horizontal: 25,
                  vertical: 15,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "•••",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(height: 2),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(fontSize: 11, color: Colors.black),
                          children: [
                            TextSpan(
                              text: "Jateng Ngopeni Nglakoni. ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                                  "Platform layanan digital Pemerintah Provinsi Jawa Tengah",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
