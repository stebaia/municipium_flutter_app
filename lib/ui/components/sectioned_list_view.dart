import 'package:flutter/material.dart';

class SectionedListView<T> extends StatelessWidget {
  final List<Section<T>> sections;
  final Widget Function(BuildContext, String) sectionHeaderBuilder;
  final Widget Function(BuildContext, T) itemBuilder;
  final BoxDecoration? itemsCombinedDecoration;

  SectionedListView(
      {required this.sections,
      required this.sectionHeaderBuilder,
      required this.itemBuilder,
      this.itemsCombinedDecoration});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sections.fold<int>(
          0, (count, section) => count + section.items.length + 1),
      itemBuilder: (context, index) {
        int sectionIndex = 0;
        for (var section in sections) {
          if (index == sectionIndex) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: sectionHeaderBuilder(context, section.title),
            );
          } else if (index < sectionIndex + section.items.length + 1) {
            var item = section.items[index - sectionIndex - 1];
            return Padding(
              padding: itemsCombinedDecoration != null
                  ? EdgeInsets.symmetric(horizontal: 8, vertical: 0)
                  : EdgeInsets.zero,
              child: Container(
                child: itemBuilder(context, item),
                decoration: itemsCombinedDecoration ?? BoxDecoration(),
              ),
            );
          }
          sectionIndex += section.items.length + 1;
        }
        return Container(); // Fallback, should never reach here.
      },
    );
  }
}

class Section<T> {
  final String title;
  final List<T> items;

  Section({required this.title, required this.items});
}

class ListItem {
  final String title;
  final String description;
  ListItem({required this.title, required this.description});
}

class ListItemWidget extends StatelessWidget {
  final ListItem item;
  final VoidCallback onTap;

  const ListItemWidget({required this.item, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
      subtitle: Text(item.description),
      onTap: onTap,
    );
  }
}
