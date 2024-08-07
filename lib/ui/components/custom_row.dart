import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomRow extends StatelessWidget {
  CustomRow(
      {super.key, required this.title, required this.icon, required this.tap});

  String title;
  IconData icon;
  Function()? tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: Text(MunicipiumUtility.removeHtmlTags(title),
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 13))),
          const SizedBox(
            width: 24,
          )
        ],
      ),
    );
  }
}

class CustomRowMenu extends StatelessWidget {
  CustomRowMenu(
      {super.key, required this.title, required this.icon, required this.tap});

  String title;
  IconData icon;
  Function()? tap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon, size: 24,),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(MunicipiumUtility.removeHtmlTags(title),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 13)),
                      
                    ],
                  ),
                  const Icon(CupertinoIcons.chevron_right, size: 20,),
                ],
              ),
            ),
            const Divider(height: 1,)
          ],
        ),
      ),
    );
  }
}

class CustomRowWithHeader extends StatelessWidget {
  const CustomRowWithHeader({super.key, required this.name, required this.value});
  final String name;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name.toUpperCase(), style: Theme.of(context).textTheme.titleSmall,),
        const SizedBox(height: 6,),
        Text(value)
      ],
    );
  }
}


