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

class _ListArticleScreenState extends State<ListArticleScreen> {
  late List<bool> bookmarkStatus;

  // Daftar kategori
  final List<String> categories = [
    "Publik",
    "Rilis",
    "Berita Daerah",
    "Berita OPD",
    "Berita Hoaks",
  ];

  // Kategori aktif
  String activeCategory = "Publik";

  final List<Map<String, String>> articles = [
    {
      "category": "Rilis",
      "image": "assets/images/artikel/artikel-9.jpg",
      "title":
          "Sikapi Dampak Opsen dari Pemerintah Pusat, Pemprov Jateng Berlakukan Pengurangan Pajak Kendaraan Bermotor",
      "desc":
          "Menyikapi kenaikan pajak kendaraan bermotor (PKB) sebagai dampak kebijakan opsen dari pemerintah pusat, Pemerintah Provinsi Jawa Tengah resmi meluncurkan kebijakan pengurangan PKB 2026",
      "date": "19 Februari 2026",
    },
    {
      "category": "Publik",
      "image": "assets/images/artikel/artikel-5.jpg",
      "title": "Pemprov Jateng Gelar Rapat Koordinasi",
      "desc": "Rapat koordinasi membahas percepatan pembangunan daerah ...",
      "date": "20 Februari 2026",
    },
    {
      "category": "Berita Daerah",
      "image": "assets/images/artikel/artikel-6.jpg",
      "title": "Program Baru untuk UMKM Jawa Tengah",
      "desc": "Program ini ditujukan untuk meningkatkan daya saing UMKM ...",
      "date": "21 Februari 2026",
    },
  ];

  // Filter artikel sesuai kategori aktif
  List<Map<String, String>> get filteredArticles {
    return articles
        .where((article) => article["category"] == activeCategory)
        .toList();
  }

  @override
  void initState() {
    super.initState();
    bookmarkStatus = List.generate(articles.length, (_) => false);
  }

  Widget buildArticleCard(int index) {
    final article = filteredArticles[index];
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
            // Filter Button horizontal
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
                        foregroundColor: isActive ? Colors.white : Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        elevation: 0
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

            // List artikel filtered
            Expanded(
              child: filteredArticles.isEmpty
                  ? Center(child: Text("Belum ada artikel di kategori ini"))
                  : ListView.builder(
                      itemCount: filteredArticles.length,
                      itemBuilder: (context, index) => buildArticleCard(index),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
