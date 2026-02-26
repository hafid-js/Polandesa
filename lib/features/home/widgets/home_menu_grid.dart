import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:polandesa/features/complaint/complaint.dart';
import 'package:polandesa/features/event/event.dart';
import 'package:polandesa/utils/constants/colors.dart';

class HomeMenuGrid extends StatelessWidget {
  final List<Map<String, String>> menuItems;
  final List<Map<String, dynamic>> menuCategories;

  const HomeMenuGrid({
    super.key,
    required this.menuItems,
    required this.menuCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 20,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 0.9,
        children: menuItems.map((item) {
          return GestureDetector(
            onTap: () {
              if (item['name'] == 'Aduan') {
                Get.to(() => ComplaintScreen());
              } else if (item['name'] == 'Event') {
                Get.to(() => EventScreen());
              } else if (item['name'] == 'Semua') {
                showBarModalBottomSheet(
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Semua Layanan",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: menuCategories.map((kategori) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          kategori["title"],
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        ...kategori["items"].map<Widget>((
                                          item,
                                        ) {
                                          return Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () => Get.to(
                                                  () => item["route"](),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      item["icon"],
                                                      width: 45,
                                                      height: 45,
                                                    ),
                                                    const SizedBox(width: 12),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            item["title"],
                                                            style:
                                                                const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: UColors
                                                                      .dark,
                                                                  fontSize: 17,
                                                                ),
                                                          ),
                                                          Text(
                                                            item["subtitle"],
                                                            style:
                                                                const TextStyle(
                                                                  color: UColors
                                                                      .dark,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 12,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Divider(
                                                color: Colors.grey[400],
                                                thickness: 1,
                                              ),
                                            ],
                                          );
                                        }).toList(),
                                        const SizedBox(height: 12),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(item['name']!),
                    content: Text(
                      "Ini adalah dialog untuk menu ${item['name']}",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Tutup"),
                      ),
                    ],
                  ),
                );
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(item["image"]!, width: 50, height: 50),
                const SizedBox(height: 2),
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
          );
        }).toList(),
      ),
    );
  }
}
