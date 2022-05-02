import 'package:flutter/material.dart';

class LastTimesTopNftDropDownButton extends StatefulWidget {
  const LastTimesTopNftDropDownButton({Key? key}) : super(key: key);

  @override
  State<LastTimesTopNftDropDownButton> createState() => _LastTimesTopNftDropDownButtonState();
}

class _LastTimesTopNftDropDownButtonState extends State<LastTimesTopNftDropDownButton> {
  List<String> items = ['7 days', '30 days', '60 days', '120 days'];
  String? value = '7 days';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      items: items.map(buildMenuItem).toList(),
      onChanged: (value) => setState(() => this.value = value),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      );
}
