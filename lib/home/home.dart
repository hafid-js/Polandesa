import 'package:flutter/material.dart';
import 'package:polandesa/common/style/padding.dart';
import 'package:polandesa/common/widgets/button/elevated_button.dart';
import 'package:polandesa/common/widgets/images/circular_image.dart';
import 'package:polandesa/common/widgets/primary_header_container.dart';
import 'package:polandesa/common/widgets/search_bar.dart';
import 'package:polandesa/home/widgets/home_app_bar.dart';
import 'package:polandesa/utils/constants/colors.dart';
import 'package:polandesa/utils/constants/helpers/hex_color.dart';
import 'package:polandesa/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> menuItems = [
      {"name": "Aduan", "image": "assets/icons/aduan-masyarakat.png"},
      {"name": "Antrean Faskes", "image": "assets/icons/antrean-faskes.png"},
      {"name": "Bursa Kerja", "image": "assets/icons/bursa-kerja.png"},
      {"name": "Event", "image": "assets/icons/event-jateng.png"},
      {"name": "Pajak", "image": "assets/icons/pajak-kendaraan.png"},
      {"name": "Trans Jateng", "image": "assets/icons/trans-jateng.png"},
      {"name": "Zilenial Jateng", "image": "assets/icons/zilenial-jateng.png"},
      {"name": "Semua", "image": "assets/icons/semua.png"},
    ];

    return Scaffold(
      backgroundColor: HexColor.fromHex("#f7f8fb"),
      appBar: AppBar(toolbarHeight: 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(height: USizes.homePrimaryHeaderHeight + 10),
                UPrimaryHeaderContainer(
                  height: USizes.homePrimaryHeaderHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      USearchBar(),
                      SizedBox(height: 30),
                      UHomeAppBar(),
                    ],
                  ),
                ),
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
                              "Call Center Ngopeni Ngeplaki",
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
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 30,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: menuItems
                    .map(
                      (item) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(item["image"]!, width: 50, height: 50),
                          SizedBox(
                            width: 60,
                            child: Text(
                              item["name"]!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),

            SizedBox(height: USizes.spaceBtwSections),
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
                      right: -20,
                      bottom: 0,
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
                                backgroundColor: HexColor.fromHex("#f7f8fb"),
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
          ],
        ),
      ),
    );
  }
}
