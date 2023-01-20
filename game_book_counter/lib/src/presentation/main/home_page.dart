import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/domain/attributes/entity/attributes.dart';
import 'package:game_book_counter/src/domain/consumable/entity/consumable.dart';
import 'package:game_book_counter/src/domain/equipment/entity/equipment.dart';
import 'package:game_book_counter/src/domain/inventory/entity/inventory.dart';
import 'package:game_book_counter/src/domain/item/entity/item.dart';
import 'package:game_book_counter/src/domain/skill/entity/skill.dart';
import 'package:game_book_counter/src/domain/spell/entity/spell.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/commons/bottom_nav_bar.dart';
import 'package:game_book_counter/src/presentation/commons/loading_indicator.dart';
import 'package:game_book_counter/src/presentation/main/components/homa_card_spells_list.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_equipments_list.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_items_list.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_player_status.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_skills_list.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_bloc.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_state.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skill_event.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skills_bloc.dart';

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
    playerBloc = getIt();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    playerBloc.init();
  }

  @override
  Widget build(BuildContext context) {
    final List<Skill> skills = [
      Skill(id: 'abcDEF', name: 'habilidade 1', description: 'Descricao da habilidade', effect: (){}),
    ];

    final List<Equipment> equipments = [
      Equipment(id: 'abcDEF1', name: 'Capacete', description: 'Protege a cabeça.', attributes: Attributes(defense: 2), buyPrice: 7, sellPrice: 3, position: EquipmentPosition.head, equipped: true),
      Equipment(id: 'abcDEF2', name: 'Botas', description: 'Agora você não vai mais andar descalço.', attributes: Attributes(defense: 2), buyPrice: 6, sellPrice: 3, position: EquipmentPosition.foots, equipped: true),
    ];

    final List<Spell> spells = [
      Spell(id: 'abcDEF1', name: 'Fogo', description: 'Cria fogo para luminar ou atacar.', manaConsume: 2, effect: (){},),
      Spell(id: 'abcDEF2', name: 'Símbolos', description: 'Permite traduzir linguagens desconhecidas.', manaConsume: 1, effect: (){},),
    ];

    final List<Consumable> consumables = [
      Consumable(id: 'vcaosdyvb', name: 'Maçã', description: 'Uma saborosa fruta que recupera 2 pontos de vida.', quantity: 3, effect: (){}, buyPrice: 5, sellPrice: 1,),
    ];

    final Inventory inventory = Inventory(
      items: [Item(id: 'lvsdfbn', name: 'Tocha', description: 'Uma simples tocha que só serve para iluminar.')],
      equipments: [Equipment(id: 'abcDEF2', name: 'Armadura de madeira', description: 'Armadura simples feita de madeira.', attributes: Attributes(defense: 3), buyPrice: 10, sellPrice: 5, position: EquipmentPosition.body, equipped: false), ... equipments],
      consumables: consumables,
    );


    return Scaffold(
      appBar: AppBar(
        title: const Text('Título do jogo'),
        centerTitle: true,
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          primary: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              BlocBuilder(
                bloc: playerBloc,
                builder: (context, state) {
                  if(state is PlayerLoadedState){
                    return HomeCardPlayerStatus(player: state.player);
                  }
                  return const LoadingIndicator();
                },
              ),

             GestureDetector(
               onTap: () => Navigator.of(context).pushNamed(PageConst.skills),
               child: HomeCardSkillsList(
                 skills: skills,
                 onTapAddSkill: () => Navigator.of(context).pushNamed(PageConst.addSkill),
                 onTapRemoveSkill: (){},
               ),
             ),

              HomeCardEquipmentsList(
                equipments: equipments,
                onTapAddEquipment: () {},
                onTapRemoveEquipment: () {},
              ),

              HomeCardSpellsList(
                spells: spells,
                onTapAddSpell: () {},
                onTapRemoveSpell: () {},
              ),

              HomeCardItemsList(
                inventory: inventory,
                onTapItem: () {},
                onTapAddItem: () {},
                onTapRemoveItem: () {},
              ),

              const SizedBox(height: 8,),
            ],
          ),
        ),
      ),
    );
  }
}