import 'package:flutter/material.dart';
import 'package:municipium/utils/theme_helper.dart';

class CustomCheckboxTile extends StatefulWidget {
  final String title;
  final bool initialValue;
  final Color color;
  final ValueChanged<bool> onChanged;

  CustomCheckboxTile({
    Key? key,
    required this.title,
    required this.initialValue,
    required this.color,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomCheckboxTile> createState() => _CustomCheckboxTileState();
}

class _CustomCheckboxTileState extends State<CustomCheckboxTile> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue;
  }

  void _handleTap() {
    setState(() {
      isChecked = !isChecked;
    });
    widget.onChanged(isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: _handleTap,
      leading: Transform.scale(
        scale: 1.5, // Aumenta la dimensione della checkbox
        child: Checkbox(
          checkColor: Colors.white,
          activeColor: ThemeHelper.blueMunicipium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0),
          ),
          side: MaterialStateBorderSide.resolveWith(
            (states) => BorderSide(
              width: 1.0,
              color: widget.color,
            ),
          ),
          value: isChecked,
          onChanged: (bool? value) {
            if (value != null) {
              setState(() {
                isChecked = value;
              });
              widget.onChanged(isChecked);
            }
          },
        ),
      ),
      title: Text(widget.title),
    );
  }
}
