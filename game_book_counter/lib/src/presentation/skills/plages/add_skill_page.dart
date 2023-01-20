import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/skill/entity/skill.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skill_event.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skills_bloc.dart';
import 'package:game_book_counter/src/utils/id_generator.dart';
import 'package:game_book_counter/src/utils/validator.dart';

class AddSkillPage extends StatefulWidget {
  const AddSkillPage({Key? key}) : super(key: key);

  @override
  State<AddSkillPage> createState() => _AddSkillPageState();
}

class _AddSkillPageState extends State<AddSkillPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppText.addSkill),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                        Skill skill = Skill(id: idGenerator(), name: name.text, description: description.text);
                        getIt<SkillsBloc>().add(SkillAddEvent(skill));
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text(AppText.save),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
