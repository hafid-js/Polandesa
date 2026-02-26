import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:polandesa/common/models/content_item.dart';
import 'package:polandesa/common/widgets/images/rounded_image.dart';
import 'package:polandesa/features/article/detail_article.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    super.key,
    required this.item,
     required this.onTap,
  });

  final ContentItem item;
    final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 165,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            URoundedImage(
              imageUrl: item.image,
              isNetworkImage: false,
              height: 100,
              width: 165,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 6),
            Text(
              item.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 2),
            Text(
              item.date,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
