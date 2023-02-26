import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/domain/skill/entity/skill.dart';
import 'package:game_book_counter/src/domain/spell/entity/spell.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/commons/bottom_nav_bar.dart';
import 'package:game_book_counter/src/presentation/commons/custom_dialogs.dart';
import 'package:game_book_counter/src/presentation/commons/error_indicator_card.dart';
import 'package:game_book_counter/src/presentation/commons/loading_indicator.dart';
import 'package:game_book_counter/src/presentation/main/components/homa_card_spells_list.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_equipments_list.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_inventory.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_player_status.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_skills_list.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_bloc.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_event.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_state.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skills_event.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skills_bloc.dart';
import 'package:game_book_counter/src/presentation/spells/bloc/spells_bloc.dart';
import 'package:game_book_counter/src/presentation/spells/bloc/spells_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PlayerBloc playerBloc;

  @override
  void initState() {
    super.initState();
    playerBloc = getIt<PlayerBloc>();
    playerBloc.init();
  }

  @override
  void dispose() {
    playerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Status'),
        centerTitle: true,
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          primary: true,
          child: BlocBuilder<PlayerBloc, PlayerState>(
            bloc: playerBloc,
            builder: (context, state){
              if (state is PlayerLoadedState) {
                if (state.player == null) {
                  return _addButton(
                    onPressed: () => Navigator.of(context).pushNamed(PageConst.addPlayer),
                    text: AppText.addPlayer,
                  );
                }
                return  Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    HomeCardPlayerStatus(player: state.player!),

                    HomeCardSkillsList(
                      skills: state.player!.skills,
                      onTapCreateSkill: () async {
                        Skill? skill = await CustomDialogs().showCreateSkillDialog(context);
                        if (skill != null) {
                          getIt<SkillsBloc>().add(AddSkillEvent(skill));
                        }
                      },
                      onTapAddSkill: (skill) {
                        if (skill != null) {
                          playerBloc.add(AddPlayerSkillEvent(skill));
                        }
                      },
                      onTapRemoveSkill: (skill) => playerBloc.add(RemovePlayerSkillEvent(skill)),
                    ),

                    HomeCardSpellsList(
                      spells: state.player!.spells,
                      onTapCreateSpell: () async {
                        Spell? spell = await CustomDialogs().showCreateSpellDialog(context);
                        if (spell != null) {
                          getIt<SpellsBloc>().add(AddSpellEvent(spell));
                        }
                      },
                      onTapAddSpell: (spell) {
                        if (spell != null) {
                          playerBloc.add(AddPlayerSpellEvent(spell));
                        }
                      },
                      onTapRemoveSpell: (spell) => playerBloc.add(RemovePlayerSpellEvent(spell)),
                    ),

                    HomeCardEquipmentsList(
                      equipments: state.player!.equipments,
                      onTapAddEquipment: (equipment) {
                        if(equipment != null) {
                          playerBloc.add(AddPlayerEquipmentEvent(equipment));
                        }
                      },
                      onTapRemoveEquipment: (equipment) => playerBloc.add(RemovePlayerEquipmentEvent(equipment)),
                    ),

                    GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed(PageConst.inventory, arguments: state.player!.id),
                      child: HomeCardInventory(inventory: state.player!.inventory),
                    ),
                    const SizedBox(height: 10,),
                  ],
                );
              }
              if (state is PlayerExceptionState) {
                return ErrorIndicatorCard(error: state.error);
              }
              return const LoadingIndicator();
            },
          ),
        ),
      ),
    );
  }

  Widget _addButton({required VoidCallback onPressed, required String text}) =>
      FractionallySizedBox(
        widthFactor: 1,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () => onPressed(),
            child: Text(text),
          ),
        ),
      );
}