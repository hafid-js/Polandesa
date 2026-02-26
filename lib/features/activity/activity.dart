import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polandesa/common/widgets/images/rounded_image.dart';
import 'package:polandesa/features/article/detail_article.dart';
import 'package:polandesa/utils/constants/colors.dart';
import 'package:polandesa/utils/constants/helpers/hex_color.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  late List<bool> bookmarkStatus;

  // Daftar kategori
  final List<String> categories = ["Proses", "Selesai"];
  final List<String> categories2 = ["Aduan Masyarakat", "Berita"];

  // Kategori aktif
  String activeCategory = "Proses";
  String activeCategory2 = "Aduan Masyarakat";

  final List<Map<String, String>> complaints = [
    {
      "kode": "LGIG21192729",
      "deskripsi":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
      "tanggal": "Purworejo, 8 jam yang lalu",
      "status": "Disposisi",
    },
    {
      "kode": "LGIG21192730",
      "deskripsi":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
      "tanggal": "Purworejo, 10 jam yang lalu",
      "status": "Verifikasi",
    },
    {
      "kode": "LGIG21192730",
      "deskripsi":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
      "tanggal": "Purworejo, 10 jam yang lalu",
      "status": "Selesai",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: UColors.backgroundColor,
        appBar: AppBar(
          title: Text(
            "Aktivitas",
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
          bottom: TabBar(
            dividerColor: Colors.grey[400],
            isScrollable: true,
            dividerHeight: 2,

            unselectedLabelStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
            labelStyle: TextStyle(fontWeight: FontWeight.w900),
            tabAlignment: TabAlignment.start,
            labelPadding: EdgeInsets.only(
              bottom: 2,
              top: 12,
              right: 16,
              left: 16,
            ),
            indicatorColor: HexColor.fromHex("#ff6900"),

            labelColor: HexColor.fromHex("#ff6900"),
            indicatorSize: TabBarIndicatorSize.label,
            // indicator: BoxDecoration(
            //   color: HexColor.fromHex("#ff6900"),
            //   backgroundBlendMode: BlendMode.color,
            // ),
            tabs: [
              Tab(
                child: Row(
                  children: [
                    Icon(Iconsax.note_1),
                    SizedBox(width: 8),
                    Text("Laporan", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    Icon(Icons.bookmark_border_outlined),
                    SizedBox(width: 8),
                    Text("Disimpan", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        final isActive = category == activeCategory;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                activeCategory = category;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isActive
                                  ? HexColor.fromHex("#4158d0")
                                  : Colors.white,
                              foregroundColor: isActive
                                  ? Colors.white
                                  : Colors.black,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              category,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) => SizedBox(
                        height: 140,
                        child: GestureDetector(
                          onTap: () => Get.to(() => DetailArticleScreen()),
                          child: Card(
                            color: Colors.white,
                            margin: const EdgeInsets.only(bottom: 12),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 8,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  URoundedImage(
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        "assets/images/artikel/artikel-9.jpg",
                                    isNetworkImage: false,
                                    width: 90,
                                    height: 90,
                                    borderRadius: 8,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "LGMB10336835",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: HexColor.fromHex("#020381"),
                                            fontSize: 10,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "Jalan demak kota ke arah pantura barat Berlubang beberapa minggu tanpa tindakan dari bupati pak Mohon ditindak lanjuti",
                                          style: TextStyle(
                                            color: UColors.black,
                                            fontSize: 13,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 6),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Infrastruktur",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                            SizedBox(width: 2),
                                            Icon(
                                              Icons.circle,
                                              size: 4,
                                              color: Colors.grey[700],
                                            ),
                                            SizedBox(width: 2),
                                            Text(
                                              "10 jam yang lalu",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 80,
                                              height: 25,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        const AlertDialog(
                                                          title: Text(
                                                            "Informasi",
                                                          ),
                                                          content: Text(
                                                            "Uji Coba",
                                                          ),
                                                        ),
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      HexColor.fromHex(
                                                        "#8ed1fc",
                                                      ).withAlpha(80),

                                                  foregroundColor:
                                                      HexColor.fromHex(
                                                        "#FF4158D0",
                                                      ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          30,
                                                        ),
                                                  ),
                                                  padding: EdgeInsets.zero,
                                                ),
                                                child: Text(
                                                  "Disposisi",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 80,
                                              height: 25,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        const AlertDialog(
                                                          title: Text(
                                                            "Informasi",
                                                          ),
                                                          content: Text(
                                                            "Uji Coba",
                                                          ),
                                                        ),
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.grey[300],

                                                  foregroundColor:
                                                      UColors.darkerGrey,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          30,
                                                        ),
                                                  ),
                                                  padding: EdgeInsets.zero,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      CupertinoIcons
                                                          .lock_open_fill,
                                                      color: Colors.grey[600],
                                                      size: 15,
                                                    ),
                                                    SizedBox(width: 4),
                                                    Text(
                                                      "Publik",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories2.length,
                      itemBuilder: (context, index) {
                        final category = categories2[index];
                        final isActive = category == activeCategory2;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                activeCategory2 = category;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isActive
                                  ? HexColor.fromHex("#4158d0")
                                  : Colors.white,
                              foregroundColor: isActive
                                  ? Colors.white
                                  : Colors.black,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              category,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: complaints.length,
                      itemBuilder: (context, index) {
                        final item = complaints[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Card(
                            color: UColors.white,
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 6,
                                right: 6,
                                top: 10,
                                bottom: 15,
                              ),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            fontWeight: FontWeight.w500,
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
                                                    builder: (context) =>
                                                        const AlertDialog(
                                                          title: Text(
                                                            "Informasi",
                                                          ),
                                                          content: Text(
                                                            "Uji Coba",
                                                          ),
                                                        ),
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      item["status"] ==
                                                          "Disposisi"
                                                      ? UColors.backgroundColor
                                                      : item["status"] ==
                                                            "Progres"
                                                      ? HexColor.fromHex(
                                                          "#fcb900",
                                                        )
                                                      : item["status"] ==
                                                            "Selesai"
                                                      ? HexColor.fromHex(
                                                          "#E5F9F2",
                                                        )
                                                      : item["status"] ==
                                                            "Verifikasi"
                                                      ? HexColor.fromHex(
                                                          "#8ed1fc",
                                                        )
                                                      : Colors.grey,
                                                  foregroundColor:
                                                      HexColor.fromHex(
                                                        "#FF4158D0",
                                                      ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          30,
                                                        ),
                                                  ),
                                                  padding: EdgeInsets.zero,
                                                ),
                                                child: Text(
                                                  item["status"]!,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.bookmark,
                                              size: 30,
                                              color: Colors.grey
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
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
