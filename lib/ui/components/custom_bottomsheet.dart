import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomBaseBottomSheet extends StatelessWidget {
  const CustomBaseBottomSheet(
      {super.key, required this.title, required this.body});

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.85,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Text(
                title.toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              GestureDetector(
                child: const Icon(Icons.close),
                onTap: () => context.maybePop(),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          SingleChildScrollView(child: body)
        ],
      ),
    );
  }
}
