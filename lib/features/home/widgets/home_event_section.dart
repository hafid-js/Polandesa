import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:polandesa/common/models/content_item.dart';
import 'package:polandesa/common/widgets/cards/content_card.dart';
import 'package:polandesa/common/widgets/custom_shapes/rounded_container.dart';
import 'package:polandesa/common/widgets/texts/section_heading.dart';
import 'package:polandesa/features/event/event.dart';

class HomeEventSection extends StatelessWidget {
  final List<ContentItem> events;
  final void Function(ContentItem) onTap;

  const HomeEventSection({
    super.key,
    required this.events,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
                  padding: const EdgeInsets.only(left: 15, top: 5, bottom: 8),
            color: Colors.white,
      child: Column(
        children: [
          USectionHeading(
            title: "Agenda Hari Ini",
            buttonTitle: "Lihat Semua",
            onPressed: () => Get.to(() => EventScreen()),
          ),
          URoundedContainer(
            child: SizedBox(
              height: 170,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: events.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final item = events[index];
                  return ContentCard(item: item, onTap: () => onTap(item));
                },
              ),
            ),
          ),
        ],
      ),
    
    );
  }
}
