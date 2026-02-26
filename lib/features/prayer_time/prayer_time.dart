import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:polandesa/common/widgets/circular_container.dart';
import 'package:polandesa/common/widgets/primary_header_container.dart';
import 'package:polandesa/utils/constants/colors.dart';
import 'package:polandesa/utils/constants/helpers/hex_color.dart';
import 'package:polandesa/utils/constants/sizes.dart';

class PrayerTimeScreen extends StatelessWidget {
  const PrayerTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    child: Container(
                      height: USizes.homePrimaryHeaderHeight,
                      color: const Color.fromRGBO(65, 88, 208, 1),
                      child: Stack(
                        children: [
                          Positioned(
                            top: -150,
                            right: -160,
                            child: UCircularContainer(
                              height: USizes.homePrimaryHeaderHeight,
                              width: USizes.homePrimaryHeaderHeight,
                              backgroundColor: UColors.white.withValues(
                                alpha: 0.1,
                              ),
                            ),
                          ),

                          Positioned(
                            top: 50,
                            right: -250,
                            child: UCircularContainer(
                              height: USizes.homePrimaryHeaderHeight,
                              width: USizes.homePrimaryHeaderHeight,
                              backgroundColor: UColors.white.withValues(
                                alpha: 0.1,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 40,
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 90,
                              bottom: 20,
                            ),
                            child: Stack(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    const SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Kota Jakarta Timur",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          "Rawamangun",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                Positioned(
                                  bottom: 15,
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: CircularPercentIndicator(
                                      backgroundColor: Colors.white,
                                      backgroundWidth: 20,
                                      radius: 80.0,
                                      lineWidth: 10.0,
                                      animation: true,
                                      percent: 0.7,
                                      center: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Maghrib",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "00:44:19",
                                            style: TextStyle(
                                              fontSize: 26,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "18:12 PM",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            "Azan (Mekah)",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                      progressColor: HexColor.fromHex(
                                        "#ff6900",
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

            Transform.translate(
              offset: const Offset(0, -20),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16, top: 10, left: 16),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: 16,
                            bottom: 10,
                            left: 16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Hari ini",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: HexColor.fromHex("#020381"),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Card(
                          color: Colors.white,
                          elevation: 1,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                            side: BorderSide(
                              color: Color.fromRGBO(65, 88, 208, 1),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  color: Color.fromRGBO(65, 88, 208, 1),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "25 Rajab 1442",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(65, 88, 208, 1),
                                      ),
                                    ),
                                    Text(
                                      "Selasa, 9 Maret 2026",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Color.fromRGBO(65, 88, 208, 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              "Mode Notifikasi : Notifikasi dan azan berkumandang",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.notifications,
                              color: Colors.grey[600],
                              size: 22,
                            ),
                          ],
                        ),

                        SizedBox(height: 10),
                        Card(
                          color: Colors.grey[100],
                          elevation: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 50,
                              top: 20,
                              bottom: 20,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle_rounded,
                                      color: Colors.grey[400],
                                      size: 20,
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      "Imsak",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "04:00",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Card(
                          color: Colors.grey[100],
                          elevation: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 20,
                              top: 20,
                              bottom: 20,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle_rounded,
                                      color: Color.fromRGBO(65, 88, 208, 1),
                                      size: 20,
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      "Subuh",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "04:43",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.volume_up_rounded,
                                      color: Colors.grey[700],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Card(
                          color: Colors.grey[100],
                          elevation: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 50,
                              top: 20,
                              bottom: 20,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle_rounded,
                                      color: Colors.grey[400],
                                      size: 20,
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      "Terbit",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "05:55",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Card(
                          color: Colors.grey[100],
                          elevation: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 20,
                              top: 20,
                              bottom: 20,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle_rounded,
                                      color: Color.fromRGBO(65, 88, 208, 1),
                                      size: 20,
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      "Zuhur",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "12:07",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.volume_up_rounded,
                                      color: Colors.grey[700],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Card(
                          color: Colors.grey[100],
                          elevation: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 50,
                              top: 20,
                              bottom: 20,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle_rounded,
                                      color: Colors.grey[400],
                                      size: 20,
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      "Maghrib",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "18:14",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Card(
                          color: Colors.grey[100],
                          elevation: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 50,
                              top: 20,
                              bottom: 20,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle_rounded,
                                      color: Colors.grey[400],
                                      size: 20,
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      "Isya",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "19:23",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
