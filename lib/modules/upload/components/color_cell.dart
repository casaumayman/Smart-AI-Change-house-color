import 'package:flutter/material.dart';

class ColorCell extends StatelessWidget {
  final Color color;
  final String label;
  final Function() onPress;

  const ColorCell(
      {super.key,
      required this.color,
      required this.label,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black, style: BorderStyle.solid, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(label),
          ),
          InkWell(
            onTap: onPress,
            child: Container(
              width: 50,
              height: 50,
              color: color,
            ),
          )
        ],
      ),
    );
  }
}
