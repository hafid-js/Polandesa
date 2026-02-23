import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:polandesa/common/widgets/images/rounded_image.dart';
import 'package:polandesa/home/article/detail_article.dart';
import 'package:polandesa/utils/constants/colors.dart';
import 'package:polandesa/utils/constants/helpers/hex_color.dart';

class ListArticleScreen extends StatefulWidget {
  const ListArticleScreen({super.key});

  @override
  State<ListArticleScreen> createState() => _ListArticleScreenState();
}

class _ListArticleScreenState extends State<ListArticleScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late List<bool> bookmarkStatus;

  final List<String> tabs = [
    "Publik",
    "Rilis",
    "Berita Daerah",
    "Berita OPD",
    "Berita Hoaks",
  ];

  final List<Map<String, String>> articles = [
    {
      "image": "assets/images/artikel/artikel-9.jpg",
      "title":
          "Sikapi Dampak Opsen dari Pemerintah Pusat, Pemprov Jateng Berlakukan Pengurangan Pajak Kendaraan Bermotor",
      "desc":
          "Menyikapi kenaikan pajak kendaraan bermotor (PKB) sebagai dampak kebijakan opsen dari pemerintah pusat, Pemerintah Provinsi Jawa Tengah resmi meluncurkan kebijakan pengurangan PKB 2026",
      "date": "19 Februari 2026",
    },
    {
      "image": "assets/images/artikel/artikel-5.jpg",
      "title": "Pemprov Jateng Gelar Rapat Koordinasi",
      "desc": "Rapat koordinasi membahas percepatan pembangunan daerah ...",
      "date": "20 Februari 2026",
    },
    {
      "image": "assets/images/artikel/artikel-6.jpg",
      "title": "Program Baru untuk UMKM Jawa Tengah",
      "desc": "Program ini ditujukan untuk meningkatkan daya saing UMKM ...",
      "date": "21 Februari 2026",
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    bookmarkStatus = List.generate(articles.length, (_) => false);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildArticleCard(int index) {
    final article = articles[index];
    return SizedBox(
      height: 140,
      child: GestureDetector(
        onTap: () => Get.to(() => DetailArticleScreen()),
        child: Card(
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                URoundedImage(
                  fit: BoxFit.cover,
                  imageUrl: article["image"]!,
                  isNetworkImage: false,
                  width: 90,
                  height: 90,
                  borderRadius: 8,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article["title"]!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: UColors.dark,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        article["desc"]!,
                        style: TextStyle(color: UColors.dark, fontSize: 13),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            article["date"]!,
                            style: const TextStyle(fontSize: 12),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                bookmarkStatus[index] = !bookmarkStatus[index];
                              });
                            },
                            child: Icon(
                              bookmarkStatus[index]
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline,
                              size: 26,
                              color: bookmarkStatus[index]
                                  ? Colors.grey[500]
                                  : Colors.grey,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
        title: Text(
          "Warta Jateng",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: tabs.length,
                itemBuilder: (context, index) {
                  final isSelected = _tabController.index == index;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _tabController.index = index;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSelected
                            ? HexColor.fromHex("#4158d0")
                            : Colors.white,
                        foregroundColor: isSelected
                            ? Colors.white
                            : Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        tabs[index],
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
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) => buildArticleCard(index),
                  ),
                  Center(child: Text("Konten Rilis")),
                  Center(child: Text("Konten Berita Daerah")),
                  Center(child: Text("Konten Berita OPD")),
                  Center(child: Text("Konten Berita Hoaks")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
