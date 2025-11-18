import 'package:flutter/material.dart';

class FilteringDropdownButton extends StatelessWidget {
  const FilteringDropdownButton({
    super.key,
    required this.value,
    required this.itemsList,
    required this.onChanged,
  });

  final String value;
  final List<String> itemsList;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      padding: EdgeInsets.only(left: 15, right: 5),
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        dropdownColor: Colors.white,
        underline: SizedBox.shrink(),
        value: value,
        isExpanded: true,
        items: itemsList
            .map((value) => DropdownMenuItem(value: value, child: Text(value)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
