import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

typedef OnSelectedValueChanged<T> = void Function(T? type);
typedef LocalizeValue<T> = String? Function(T value);

class SelectorValueSheet<T> extends StatelessWidget {
  final String? title;
  final List<T> values;
  final T? initialValue;
  final OnSelectedValueChanged<T>? onSelectedValueChanged;
  final LocalizeValue<T>? localizeValue;

  const SelectorValueSheet(
      {super.key,
      this.title,
      required this.values,
      this.initialValue,
      this.onSelectedValueChanged,
      this.localizeValue});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          (title != null)
              ? Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    title!,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                )
              : Container(),
          ...values.map((value) => RadioListTile<T>(
                value: value,
                groupValue: value == initialValue ? value : null,
                onChanged: onSelectedValueChanged != null
                    ? (value) {
                        onSelectedValueChanged!(value);
                        context.maybePop();
                      }
                    : null,
                title: Text(localizeValue?.call(value) ?? value.toString()),
              ))
        ],
      ),
    ));
  }
}
