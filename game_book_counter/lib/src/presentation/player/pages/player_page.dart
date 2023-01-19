import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/domain/player/entity/player_character.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/commons/loading_indicator.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_bloc.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_event.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_state.dart';
import 'package:game_book_counter/src/utils/validator.dart';

class PlayerPage extends StatefulWidget {
  final PlayerCharacter player;

  const PlayerPage({required this.player, Key? key}) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late PlayerBloc bloc;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController alias = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController level = TextEditingController();
  TextEditingController exp = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc = getIt();
    bloc.init();
    name.text = widget.player.name;
    alias.text = widget.player.alias ?? '';
    description.text = widget.player.description ?? '';
    level.text = widget.player.level.toString();
    exp.text = widget.player.exp.toString();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(bloc.state is PlayerLoadedState) {
      level.text = (bloc.state as PlayerLoadedState).player.level.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.player.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocConsumer<PlayerBloc, PlayerState>(
              bloc: bloc,
              listener: (context, state) {
                if(state is PlayerLoadedState) {
                  level.text = (bloc.state as PlayerLoadedState).player.level.toString();
                  exp.text = (bloc.state as PlayerLoadedState).player.exp.toString();
                }
              },
              builder: (context, state) {
                if(state is PlayerLoadedState){
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: TextFormField(
                          onChanged: (value){

                          },
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
                          onChanged: (value){

                          },
                          decoration: const InputDecoration(
                            labelText: AppText.alias,
                          ),
                          keyboardType: TextInputType.text,
                          autocorrect: false,
                          validator: (value) => Validator().personAlias(value),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () => bloc.add(PlayerSetLevelEvent(player: state.player, level: state.player.level - 1)),
                              child: const Icon(Icons.remove),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: TextFormField(
                                  controller: level,
                                  decoration: const InputDecoration(
                                    labelText: AppText.level,
                                  ),
                                  keyboardType: TextInputType.text,
                                  autocorrect: false,
                                  enabled: false,
                                  validator: (value) => Validator().personAlias(value),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => bloc.add(PlayerSetLevelEvent(player: state.player, level: state.player.level+1)),
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () => bloc.add(PlayerSetExpEvent(player: state.player, exp: state.player.exp-1)),
                              child: const Icon(Icons.remove),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: TextFormField(
                                  controller: exp,
                                  decoration: const InputDecoration(
                                    labelText: AppText.exp,
                                  ),
                                  keyboardType: TextInputType.text,
                                  autocorrect: false,
                                  enabled: false,
                                  validator: (value) => Validator().personAlias(value),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => bloc.add(PlayerSetExpEvent(player: state.player, exp: state.player.exp+1)),
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),

                    ],
                  );
                }

                return const LoadingIndicator();

              },
            ),
          ),
        ),
      ),
    );
  }
}
