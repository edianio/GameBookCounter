import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/item/entity/item.dart';
import 'package:game_book_counter/src/main/app_const.dart';

class AddItemForm extends StatefulWidget {
  final Function(Item) onConfirm;
  final VoidCallback onClose;
  final List<Item> items;

  const AddItemForm({required this.items, required this.onConfirm, required this.onClose, Key? key,}) : super(key: key);

  @override
  State<AddItemForm> createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  late Item item;
  final List<DropdownMenuItem<Item>> items = [];

  @override
  void initState() {
    super.initState();
    item = widget.items.first;
    items.addAll(_generateItems());
  }

  List<DropdownMenuItem<Item>> _generateItems() => List.generate(
    widget.items.length,
        (index) => DropdownMenuItem(
      key: Key(index.toString()),
      value: widget.items[index],
      child: Text(widget.items[index].name),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: DropdownButtonFormField<Item>(
              value: item,
              onChanged: (value) {
                setState(() {
                  item = value!;
                });
              },
              items: items,
            ),
          ),
          FractionallySizedBox(
            widthFactor: 1,
            child: ElevatedButton(
              onPressed: () async {
                widget.onConfirm(item);
              },
              child: const Text(AppText.save),
            ),
          ),
          const SizedBox(height: 8,),
          FractionallySizedBox(
            widthFactor: 1,
            child: ElevatedButton(
              onPressed: () => widget.onClose(),
              child: const Text(AppText.close),
            ),
          ),
        ],
      ),
    );
  }
}
