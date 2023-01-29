import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/skill/entity/skill.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/utils/id_generator.dart';
import 'package:game_book_counter/src/utils/validator.dart';

class CreateSkillForm extends StatefulWidget {
  final Function(Skill) onConfirm;
  final VoidCallback onClose;
  const CreateSkillForm({required this.onConfirm, required this.onClose, Key? key}) : super(key: key);

  @override
  State<CreateSkillForm> createState() => _CreateSkillFormState();
}

class _CreateSkillFormState extends State<CreateSkillForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                    labelText: AppText.name,
                  ),
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  validator: (value) => Validator().personAlias(value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  controller: description,
                  decoration: const InputDecoration(
                    labelText: AppText.description,
                  ),
                  keyboardType: TextInputType.text,
                  autocorrect: true,
                  validator: (value) => Validator().personAlias(value),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState?.validate() == true) {
                      final Skill skill = Skill(
                        id: idGenerator(),
                        name: name.text,
                        description: description.text.isEmpty ? null : description.text,
                      );
                      widget.onConfirm(skill);
                    }
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
        ),
      ),
    );
  }
}
