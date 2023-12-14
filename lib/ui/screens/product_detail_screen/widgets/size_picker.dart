import 'package:flutter/material.dart';

import '../../../../data/models/product.dart';

// ignore: must_be_immutable
class SizePicker extends StatefulWidget {
  SizePicker({
    super.key,
    required this.product,
    required this.selectedIndex,
  });

  final Product product;
  int selectedIndex;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  void updateIndex(int index) {
    widget.selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: widget.product.attributes.sizes.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;

        return ActionChip(
          label: Text(item.size.toString()),
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(
              Radius.zero,
            ),
          ),
          backgroundColor:
              index == widget.selectedIndex ? Colors.black : Colors.white,
          labelStyle: TextStyle(
            color: index == widget.selectedIndex ? Colors.white : Colors.black,
          ),
          onPressed: () => updateIndex(index),
        );
      }).toList(),
    );
  }
}
