import 'package:flutter/cupertino.dart';
import 'package:municipium/utils/municipium_utility.dart';

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
