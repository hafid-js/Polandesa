import 'package:flutter/material.dart';
import 'package:polandesa/utils/constants/colors.dart';

class ExpandableDescription extends StatefulWidget {
  final String description;
  const ExpandableDescription({required this.description});

  @override
  State<ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.description,
          maxLines: isExpanded ? null : 5,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
        ),
        GestureDetector(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              isExpanded ? "Read Less" : "Read More",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: UColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
