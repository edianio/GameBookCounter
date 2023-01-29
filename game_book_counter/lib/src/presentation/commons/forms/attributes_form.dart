import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_book_counter/src/domain/attributes/entity/attributes.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/utils/validator.dart';

class AttributesForm extends StatefulWidget {
  final Function(Attributes) onConfirm;
  const AttributesForm({required this.onConfirm, Key? key}) : super(key: key);

  @override
  State<AttributesForm> createState() => _AttributesFormState();
}

class _AttributesFormState extends State<AttributesForm> {
  GlobalKey<FormState> attributesFormKey = GlobalKey<FormState>();
  TextEditingController life = TextEditingController();
  TextEditingController mana = TextEditingController();
  TextEditingController attack = TextEditingController();
  TextEditingController defense = TextEditingController();
  TextEditingController luck = TextEditingController();
  TextEditingController speed = TextEditingController();
  TextEditingController intelligence = TextEditingController();

  Widget _field(TextEditingController controller, String label) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            counterText: '',
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          maxLength: 4,
          validator: (value) => Validator().nullOrEmpty(value),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: attributesFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _field(life, AppText.life),
            _field(mana, AppText.mana),
            _field(attack, AppText.attack),
            _field(defense, AppText.defense),
            _field(luck, AppText.luck),
            _field(speed, AppText.speed),
            _field(intelligence, AppText.intelligence),
            FractionallySizedBox(
              widthFactor: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: ElevatedButton(
                  onPressed: () {
                    if (attributesFormKey.currentState!.validate()) {
                      final Attributes attributes = Attributes(
                        life: int.parse(life.text),
                        mana: int.parse(mana.text),
                        attack: int.parse(attack.text),
                        defense: int.parse(defense.text),
                        luck: int.parse(luck.text),
                        speed: int.parse(speed.text),
                        intelligence: int.parse(intelligence.text),
                      );
                      widget.onConfirm(attributes);
                    }
                  },
                  child: const Text(AppText.save),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    life.dispose();
    mana.dispose();
    attack.dispose();
    defense.dispose();
    luck.dispose();
    speed.dispose();
    intelligence.dispose();
    super.dispose();
  }
}
