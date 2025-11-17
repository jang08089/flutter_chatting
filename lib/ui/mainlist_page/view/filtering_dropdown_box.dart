import 'package:flutter/material.dart';

class FilteringDropdownButton<T> extends StatelessWidget {
  const FilteringDropdownButton({
    super.key,
    required this.value,
    required this.itemsMap,
    required this.onChanged,
  });

  final T? value;
  final Map<T?, String> itemsMap; // key: 실제 값, value: 화면에 보여줄 문자열
  final void Function(T?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      padding: EdgeInsets.only(left: 15, right: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<T>(
        dropdownColor: Colors.white,
        underline: SizedBox.shrink(),
        value: value,
        isExpanded: true,
        items: itemsMap.entries
            .map(
              (entry) => DropdownMenuItem<T>(
                value: entry.key,
                child: Text(entry.value),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
