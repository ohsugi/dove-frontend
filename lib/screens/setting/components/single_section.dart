import 'package:flutter/material.dart';

class SingleSection extends StatelessWidget {
  const SingleSection({
    super.key,
    this.title,
    required this.children,
  });
  final String? title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          Column(
            children: children,
          ),
        ],
      );
}
