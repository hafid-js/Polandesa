import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:polandesa/features/article/data/articles.dart';
import 'package:polandesa/features/article/detail_article.dart';
import 'package:polandesa/common/widgets/cards/article_card.dart';
import 'package:polandesa/features/article/widgets/category_filter.dart';
import 'package:polandesa/utils/constants/colors.dart';

class ListArticleScreen extends StatefulWidget {
  const ListArticleScreen({super.key});

  @override
  State<ListArticleScreen> createState() => _ListArticleScreenState();
}

class _ListArticleScreenState extends State<ListArticleScreen> {
  late List<bool> bookmarkStatus;

  final List<String> categories = [
    "Publik",
    "Rilis",
    "Berita Daerah",
    "Berita OPD",
    "Berita Hoaks",
  ];

  String activeCategory = "Publik";

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
            CategoryFilter(
              categories: categories,
              activeCategory: activeCategory,
              onCategorySelected: (category) {
                setState(() {
                  activeCategory = category;
                });
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filteredArticles.isEmpty
                  ? Center(child: Text("Belum ada artikel di kategori ini"))
                  : ListView.builder(
                      itemCount: filteredArticles.length,
                      itemBuilder: (context, index) {
                        final article = filteredArticles[index];
                        return UArticleCard(
                          article: article,
                          isBookmarked: bookmarkStatus[index],
                          onBookmarkToggle: () {
                            setState(() {
                              bookmarkStatus[index] = !bookmarkStatus[index];
                            });
                          },
                          onTap: () => Get.to(() => DetailArticleScreen()),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
