import 'package:flutter/material.dart';

class SimpleDropDown extends StatefulWidget {
  const SimpleDropDown({
    super.key,
    this.underline,
    this.icon,
    this.style,
    this.hintStyle,
    this.dropdownColor,
    this.iconEnabledColor,
    this.onChanged,
    this.onSelectedIndex,
    this.initialSelectedIndex,
    this.hintText,
    required this.itemList,
  });

  final Widget? underline, icon;
  final TextStyle? style, hintStyle;
  final Color? dropdownColor, iconEnabledColor;
  final ValueChanged<String>? onChanged;
  final ValueChanged<int>? onSelectedIndex;
  final int? initialSelectedIndex;
  final String? hintText;
  final List<String> itemList;

  int? getSelectedIndex() => _SimpleDropDownState()._selectedIndex;

  @override
  State<SimpleDropDown> createState() => _SimpleDropDownState();
}

class _SimpleDropDownState extends State<SimpleDropDown> {
  late int? _selectedIndex = widget.initialSelectedIndex;

  @override
  Widget build(BuildContext context) => DropdownButton<String>(
        value: widget.itemList[_selectedIndex ?? 0],
        underline: widget.underline,
        icon: widget.icon,
        dropdownColor: widget.dropdownColor,
        style: widget.style,
        iconEnabledColor: widget.iconEnabledColor,
        onChanged: (String? newValue) {
          setState(() {
            _selectedIndex = widget.itemList.indexOf(newValue!);
            widget.onChanged?.call(newValue);
            widget.onSelectedIndex?.call(_selectedIndex!);
          });
        },
        hint: widget.hintText != null
            ? Text(widget.hintText!, style: widget.hintStyle)
            : null,
        items: widget.itemList
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
      );
}
