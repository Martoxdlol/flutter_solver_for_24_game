import 'package:flutter/material.dart';

class SplitView extends StatelessWidget {
  const SplitView({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final rowChildren = children
        .map((c) => Expanded(
              child: c,
            ))
        .toList();

    if (width > height && width > 500) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: rowChildren,
      );
    }

    return Column(
      children: children,
    );
  }
}
