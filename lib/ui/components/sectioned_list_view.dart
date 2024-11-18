import 'package:flutter/material.dart';

class SectionedListView<T> extends StatelessWidget {
  final List<Section<T>> sections;
  final Widget Function(BuildContext, String) sectionHeaderBuilder;
  final Widget Function(BuildContext, T, int index, int sectionIndex)
      itemBuilder;
  final Widget? separator;
  final Widget? sectionSeparator;
  final BoxDecoration? sectionItemsDecoration;
  final ScrollController? controller;

  const SectionedListView(
      {super.key,
      required this.sections,
      required this.sectionHeaderBuilder,
      required this.itemBuilder,
      this.separator,
      this.sectionSeparator,
      this.sectionItemsDecoration,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      shrinkWrap: true,
      itemCount: sections.fold<int>(
        0,
        (count, section) => count + section.items.length + 1,
      ),
      itemBuilder: (context, index) {
        int currentIndex = 0;
        for (var sectionIndex = 0;
            sectionIndex < sections.length;
            sectionIndex++) {
          final section = sections[sectionIndex];
          if (index == currentIndex) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: sectionHeaderBuilder(context, section.title),
            );
          } else if (index < currentIndex + section.items.length + 1) {
            final itemIndex = index - currentIndex - 1;
            if (itemIndex < section.items.length) {
              final item = section.items[itemIndex];
              return Padding(
                padding: sectionItemsDecoration != null
                    ? const EdgeInsets.symmetric(horizontal: 8)
                    : EdgeInsets.zero,
                child: Column(
                  children: [
                    Container(
                      decoration:
                          sectionItemsDecoration ?? const BoxDecoration(),
                      child:
                          itemBuilder(context, item, itemIndex, sectionIndex),
                    ),
                    if (separator != null &&
                        itemIndex < section.items.length - 1)
                      separator!,
                    if (sectionSeparator != null &&
                        itemIndex == section.items.length - 1)
                      sectionSeparator!
                  ],
                ),
              );
            }
          }
          currentIndex += section.items.length + 1;
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

class ListItem<T> {
  final String title;
  final String description;
  final T item;
  ListItem(
      {required this.title, required this.description, required this.item});
}
