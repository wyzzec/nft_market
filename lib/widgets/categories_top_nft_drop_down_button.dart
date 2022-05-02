import 'package:flutter/material.dart';

class CategoriesTopNftDropDownButton extends StatefulWidget {
  const CategoriesTopNftDropDownButton({Key? key}) : super(key: key);

  @override
  State<CategoriesTopNftDropDownButton> createState() => _CategoriesTopNftDropDownButtonState();
}

class _CategoriesTopNftDropDownButtonState extends State<CategoriesTopNftDropDownButton> {
  final List<String> _items = ['All categories', 'BSC', 'ETH', 'Polygon'];
  String? _value = 'All categories';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _value,
      items: _items.map(buildMenuItem).toList(),
      onChanged: (value) => setState(() => _value = value),
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
