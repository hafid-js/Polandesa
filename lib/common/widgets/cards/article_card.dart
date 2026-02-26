// ===== WIDGET: ArticleCard =====
import 'package:flutter/material.dart';
import 'package:polandesa/common/widgets/images/rounded_image.dart';
import 'package:polandesa/utils/constants/colors.dart';

class UArticleCard extends StatelessWidget {
  final Map<String, String> article;
  final bool isBookmarked;
  final VoidCallback onBookmarkToggle;
  final VoidCallback onTap;

  const UArticleCard({
    super.key,
    required this.article,
    required this.isBookmarked,
    required this.onBookmarkToggle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: InkWell(
        onTap: onTap,
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
                          InkWell(
                            onTap: onBookmarkToggle,
                            child: Icon(
                              isBookmarked
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline,
                              size: 26,
                              color: isBookmarked ? Colors.grey[500] : Colors.grey,
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
}