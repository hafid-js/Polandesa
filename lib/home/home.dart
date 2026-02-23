import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:polandesa/common/style/padding.dart';
import 'package:polandesa/common/widgets/custom_shapes/rounded_container.dart';
import 'package:polandesa/common/widgets/images/circular_image.dart';
import 'package:polandesa/common/widgets/images/rounded_image.dart';
import 'package:polandesa/common/widgets/primary_header_container.dart';
import 'package:polandesa/common/widgets/search_bar.dart';
import 'package:polandesa/common/widgets/texts/section_heading.dart';
import 'package:polandesa/home/article/detail_article.dart';
import 'package:polandesa/home/article/list_article.dart';
import 'package:polandesa/home/complaint/complaint.dart';
import 'package:polandesa/home/event/detail_event.dart';
import 'package:polandesa/home/event/event.dart';
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

    final List<Map<String, dynamic>> menuCategories = [
      {
        "title": "Layanan Masyarakat",
        "items": [
          {
            "icon": "assets/icons/aduan-masyarakat.png",
            "title": "Aduan",
            "subtitle": "Salurkan keluhan seputar layanan publik",
          },
          {
            "icon": "assets/icons/pajak-kendaraan.png",
            "title": "Pajak Kendaraan",
            "subtitle": "Cek dan bayar pajak kendaraan dengan mudah",
          },
          {
            "icon": "assets/icons/pajak-kendaraan.png",
            "title": "Layanan Dukcapil",
            "subtitle": "Urus dokumen kependudukan secara online",
          },
        ],
      },
      {
        "title": "Karier dan Usaha",
        "items": [
          {
            "icon": "assets/icons/aduan-masyarakat.png",
            "title": "Bursa Kerja",
            "subtitle": "Temukan lowongan pekerjaan di Jawa Tengah",
          },
          {
            "icon": "assets/icons/zilenial-jateng.png",
            "title": "Zilenial Jateng",
            "subtitle": "Ruang kolaborasi kreatif anak muda Jateng",
          },
        ],
      },
      {
        "title": "Kesehatan",
        "items": [
          {
            "icon": "assets/icons/antrean-faskes.png",
            "title": "Antrean Faskes",
            "subtitle": "Daftar antrean fakses tanpa harus datang",
          },
          {
            "icon": "assets/icons/zilenial-jateng.png",
            "title": "Ambulans",
            "subtitle": "Daftar ambulans terdekat",
          },
        ],
      },
      {
        "title": "Transportasi",
        "items": [
          {
            "icon": "assets/icons/antrean-faskes.png",
            "title": "Trans Jateng",
            "subtitle": "Info rute dan jadwal Bus Trans Jateng",
          },
          {
            "icon": "assets/icons/zilenial-jateng.png",
            "title": "SPKLU Terdekat",
            "subtitle": "Info SPKLU di Jawa tengah",
          },
        ],
      },
      {
        "title": "Kesehatan",
        "items": [
          {
            "icon": "assets/icons/antrean-faskes.png",
            "title": "Antrean Faskes",
            "subtitle": "Daftar antrean fakses tanpa harus datang",
          },
          {
            "icon": "assets/icons/zilenial-jateng.png",
            "title": "Ambulans",
            "subtitle": "Daftar ambulans terdekat",
          },
        ],
      },
      {
        "title": "Informasi Publik",
        "items": [
          {
            "icon": "assets/icons/event-jateng.png",
            "title": "Event",
            "subtitle": "Jadwal acara dan kegiatan di Jawa Tengah",
          },
          {
            "icon": "assets/icons/zilenial-jateng.png",
            "title": "Berita",
            "subtitle": "Update berita dan info penting seputar Jawa Tengah",
          },
        ],
      },
    ];

    return Scaffold(
      backgroundColor: UColors.backgroundColor,
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
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 20,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 0.9,
                children: menuItems
                    .map(
                      (item) => GestureDetector(
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.8,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 16,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: menuCategories.map((
                                                kategori,
                                              ) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      kategori["title"],
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    ...kategori["items"].map<
                                                      Widget
                                                    >((item) {
                                                      return Column(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () => Get.to(
                                                              () =>
                                                                  item["route"](),
                                                            ),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Image.asset(
                                                                  item["icon"],
                                                                  width: 50,
                                                                  height: 50,
                                                                ),
                                                                const SizedBox(
                                                                  width: 12,
                                                                ),
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
                                                                        style: const TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              UColors.dark,
                                                                          fontSize:
                                                                              17,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        item["subtitle"],
                                                                        style: const TextStyle(
                                                                          color:
                                                                              UColors.dark,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 4,
                                                          ),
                                                          Divider(
                                                            color: Colors
                                                                .grey[400],
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
                      ),
                    )
                    .toList(),
              ),
            ),
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
                  SizedBox(height: 10),
                  USectionHeading(
                    title: "Agenda Hari Ini",
                    buttonTitle: "Lihat Semua",
                    onPressed: () => Get.to(() => EventScreen()),
                  ),
                ],
              ),
            ),

            URoundedContainer(
              padding: const EdgeInsets.only(left: 15, top: 5),
              backgroundColor: UColors.light,
              child: SizedBox(
                height: 170,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  separatorBuilder: (_, __) => SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    final articles = [
                      {
                        "image": "assets/images/events/event-5.jpg",
                        "title":
                            "Jalan Sehat Dan Baksos Karang Taruna Desa Gunung Condong",
                        "date": "23-24 Februari 2026",
                      },
                      {
                        "image": "assets/images/agenda/agenda-2.jpg",
                        "title":
                            "Penyaluran Bantuan Perhutani Untuk Keluarga Miskin",
                        "date": "13 Februari - 1 Maret 2026",
                      },
                    ];

                    final item = articles[index];

                    return SizedBox(
                      width: 165,
                      child: GestureDetector(
                        onTap: () => Get.to(() => DetailEventScreen()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            URoundedImage(
                              imageUrl: item["image"]!,
                              isNetworkImage: false,
                              height: 100,
                              width: 165,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 6),
                            Text(
                              item["title"]!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 2),
                            Text(
                              item["date"]!,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
              child: Column(
                children: [
                  USectionHeading(
                    title: "Artikel Terbaru",
                    buttonTitle: "Lihat Semua",
                    onPressed: () => Get.to(() => ListArticleScreen()),
                  ),
                ],
              ),
            ),

            URoundedContainer(
              padding: const EdgeInsets.only(left: 15, top: 5),
              backgroundColor: UColors.light,
              child: SizedBox(
                height: 170,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  separatorBuilder: (_, __) => SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    final articles = [
                      {
                        "image": "assets/images/artikel/artikel-9.jpg",
                        "title":
                            "Sikapi Dampak Opsen dari Pemerintah Pusat, Pemprov Jateng Berlakukan Pengurangan Pajak Kendaraan Bermotor",
                        "date": "24 Februari 2026",
                      },
                      {
                        "image": "assets/images/artikel/artikel-2.jpg",
                        "title":
                            "Sosialisasi Kekosongan Perangkat Desa Plipiran",
                        "date": "19 Februari 2026",
                      },
                      {
                        "image": "assets/images/artikel/artikel-3.jpg",
                        "title":
                            "Peningkatan Kapasitas Perangkat Desa Se- Kecamatan Bruno",
                        "date": "17 Februari 2026",
                      },
                    ];

                    final item = articles[index];

                    return SizedBox(
                      width: 165,
                      child: GestureDetector(
                        onTap: () => Get.to(() => DetailArticleScreen()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            URoundedImage(
                              imageUrl: item["image"]!,
                              isNetworkImage: false,
                              height: 100,
                              width: 165,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 6),
                            Text(
                              item["title"]!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 2),
                            Text(
                              item["date"]!,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            SizedBox(height: USizes.spaceBtwSections),

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
