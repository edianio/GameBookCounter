import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_book_counter/src/domain/spell/entity/spell.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/utils/id_generator.dart';
import 'package:game_book_counter/src/utils/validator.dart';

class CreateSpellForm extends StatefulWidget {
  final Function(Spell) onConfirm;
  final VoidCallback onClose;

  const CreateSpellForm({required this.onConfirm, required this.onClose, Key? key,}) : super(key: key);

  @override
  State<CreateSpellForm> createState() => _CreateSpellFormState();
}

class _CreateSpellFormState extends State<CreateSpellForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController manaConsume = TextEditingController();

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
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  controller: manaConsume,
                  decoration: const InputDecoration(
                    labelText: AppText.manaConsume,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState?.validate() == true) {
                      final Spell spell = Spell(
                        id: idGenerator(),
                        name: name.text,
                        description: description.text.isEmpty ? null : description.text,
                        manaConsume: manaConsume.text.isEmpty ? 0 : int.parse(manaConsume.text),
                      );
                      widget.onConfirm(spell);
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
