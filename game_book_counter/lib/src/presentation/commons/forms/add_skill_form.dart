import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/skill/entity/skill.dart';
import 'package:game_book_counter/src/main/app_const.dart';

class AddSkillForm extends StatefulWidget {
  final Function(Skill) onConfirm;
  final VoidCallback onClose;
  final List<Skill> skills;
  const AddSkillForm({required this.skills, required this.onConfirm, required this.onClose, Key? key}) : super(key: key);

  @override
  State<AddSkillForm> createState() => _AddSkillFormState();
}

class _AddSkillFormState extends State<AddSkillForm> {
  late Skill skill;
  final List<DropdownMenuItem<Skill>> items = [];

  @override
  void initState() {
    super.initState();
    skill = widget.skills.first;
    items.addAll(_generateItems());
  }

  List<DropdownMenuItem<Skill>> _generateItems() => List.generate(
        widget.skills.length,
        (index) => DropdownMenuItem(
          key: Key(index.toString()),
          value: widget.skills[index],
          child: Text(widget.skills[index].name),
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
            child: DropdownButtonFormField<Skill>(
              value: skill,
              onChanged: (value) {
                setState(() {
                  skill = value!;
                });
              },
              items: items,
            ),
          ),
          FractionallySizedBox(
            widthFactor: 1,
            child: ElevatedButton(
              onPressed: () async {
                widget.onConfirm(skill);
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
