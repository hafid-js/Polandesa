import 'package:flutter/material.dart';
import 'package:polandesa/common/models/content_item.dart';
import 'package:polandesa/common/widgets/cards/content_card.dart';
import 'package:polandesa/common/widgets/custom_shapes/rounded_container.dart';

class HomeArticleSection extends StatelessWidget {
  final List<ContentItem> events;
  final void Function(ContentItem) onTap;

  const HomeArticleSection({
    super.key,
    required this.events,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return URoundedContainer(
      padding: const EdgeInsets.only(left: 15, top: 5),
      backgroundColor: Colors.grey[200]!,
      child: SizedBox(
        height: 170,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: events.length,
          separatorBuilder: (_, __) => const SizedBox(width: 16),
          itemBuilder: (context, index) {
            final item = events[index];
            return ContentCard(
              item: item,
              onTap: () => onTap(item),
            );
          },
        ),
      ),
    );
  }
}