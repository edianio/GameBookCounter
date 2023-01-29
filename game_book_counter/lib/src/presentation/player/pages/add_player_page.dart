import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/domain/attributes/entity/attributes.dart';
import 'package:game_book_counter/src/domain/inventory/entity/inventory.dart';
import 'package:game_book_counter/src/domain/player/entity/player_character.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/commons/custom_dialogs.dart';
import 'package:game_book_counter/src/presentation/commons/loading_indicator.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_bloc.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_event.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_state.dart';
import 'package:game_book_counter/src/utils/id_generator.dart';
import 'package:game_book_counter/src/utils/validator.dart';

class AddPlayerPage extends StatefulWidget {
  const AddPlayerPage({Key? key}) : super(key: key);

  @override
  State<AddPlayerPage> createState() => _AddPlayerPageState();
}

class _AddPlayerPageState extends State<AddPlayerPage> {
  late final PlayerBloc bloc;
  Attributes attributes = Attributes();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController alias = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController level = TextEditingController();
  TextEditingController exp = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc = getIt<PlayerBloc>();
  }

  @override
  void dispose() {
    name.dispose();
    alias.dispose();
    description.dispose();
    level.dispose();
    exp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppText.addPlayer),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
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
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    controller: alias,
                    decoration: const InputDecoration(
                      labelText: AppText.alias,
                    ),
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    controller: description,
                    decoration: const InputDecoration(
                      labelText: AppText.description,
                    ),
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    controller: level,
                    decoration: const InputDecoration(
                      labelText: AppText.level,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    autocorrect: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    controller: exp,
                    decoration: const InputDecoration(
                      labelText: AppText.exp,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    autocorrect: false,
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () async {
                        attributes = await CustomDialogs().showAttributesDialog(context);
                      },
                      child: const Text(AppText.attributes),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: BlocBuilder<PlayerBloc, PlayerState>(
                      bloc: bloc,
                      builder: (context, state) {
                        if (state is PlayerLoadingState) {
                          return const LoadingIndicator();
                        }
                        if (state is PlayerLoadedState) {
                          if (state.player != null) {
                            Navigator.of(context).pop();
                          }
                        }
                        return ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              final id = idGenerator();
                              final player = PlayerCharacter(
                                id: id,
                                name: name.text,
                                alias: alias.text.isEmpty ? null : alias.text,
                                description: description.text.isEmpty ? null : description.text,
                                attributes: attributes,
                                skills: [],
                                spells: [],
                                equipments: [],
                                inventory: Inventory(
                                  playerId: id,
                                  consumables: [],
                                  equipments: [],
                                  items: [],
                                  money: 0,
                                ),
                              );
                              bloc.add(AddPlayerEvent(player));
                            }
                          },
                          child: const Text(AppText.save),
                        );
                      },
                    ),
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
