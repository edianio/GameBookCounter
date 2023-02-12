import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/spell/entity/spell.dart';
import 'package:game_book_counter/src/main/app_const.dart';

class AddSpellForm extends StatefulWidget {
  final Function(Spell) onConfirm;
  final VoidCallback onClose;
  final List<Spell> spells;

  const AddSpellForm({required this.spells, required this.onConfirm, required this.onClose, Key? key,}) : super(key: key);

  @override
  State<AddSpellForm> createState() => _AddSpellFormState();
}

class _AddSpellFormState extends State<AddSpellForm> {
  late Spell spell;
  final List<DropdownMenuItem<Spell>> items = [];

  @override
  void initState() {
    super.initState();
    spell = widget.spells.first;
    items.addAll(_generateItems());
  }

  List<DropdownMenuItem<Spell>> _generateItems() => List.generate(
    widget.spells.length,
        (index) => DropdownMenuItem(
      key: Key(index.toString()),
      value: widget.spells[index],
      child: Text(widget.spells[index].name),
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
            child: DropdownButtonFormField<Spell>(
              value: spell,
              onChanged: (value) {
                setState(() {
                  spell = value!;
                });
              },
              items: items,
            ),
          ),
          FractionallySizedBox(
            widthFactor: 1,
            child: ElevatedButton(
              onPressed: () async {
                widget.onConfirm(spell);
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
