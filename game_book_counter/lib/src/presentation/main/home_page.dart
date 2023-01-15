import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/attributes/entity/attributes.dart';
import 'package:game_book_counter/src/domain/consumable/entity/consumable.dart';
import 'package:game_book_counter/src/domain/equipment/entity/equipment.dart';
import 'package:game_book_counter/src/domain/inventory/entity/inventory.dart';
import 'package:game_book_counter/src/domain/item/entity/item.dart';
import 'package:game_book_counter/src/domain/job/entity/job.dart';
import 'package:game_book_counter/src/domain/player/entity/player_character.dart';
import 'package:game_book_counter/src/domain/skill/entity/skill.dart';
import 'package:game_book_counter/src/domain/spell/entity/spell.dart';
import 'package:game_book_counter/src/presentation/commons/bottom_nav_bar.dart';
import 'package:game_book_counter/src/presentation/main/components/homa_card_spells_list.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_equipments_list.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_items_list.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_player_status.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_skills_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Skill> skills = [
      Skill(id: 'abcDEF', name: 'habilidade 1', description: 'Descricao da habilidade', effect: (){debugPrint('Efeito!!!');}),
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
    final PlayerCharacter player = PlayerCharacter(id: 'hdcblas', name: 'Yusuki', description: 'Um jogador', attributes: Attributes(attack: 12, defense: 5,), skills: skills, spells: spells, equipments: equipments, inventory: inventory, job: Job(id: 'sdobf', name: 'Samurai', description: 'Guerreiro antigo que luta com duas espadas',));

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

              HomeCardPlayerStatus(player: player),

             HomeCardSkillsList(
               skills: skills,
               onTapAddSkill: (){},
               onTapRemoveSkill: (){},
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