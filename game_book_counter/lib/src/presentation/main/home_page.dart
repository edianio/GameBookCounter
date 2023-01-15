import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/attributes/entity/attributes.dart';
import 'package:game_book_counter/src/domain/equipment/entity/equipment.dart';
import 'package:game_book_counter/src/domain/skill/entity/skill.dart';
import 'package:game_book_counter/src/domain/spell/entity/spell.dart';
import 'package:game_book_counter/src/presentation/commons/bottom_nav_bar.dart';
import 'package:game_book_counter/src/presentation/main/components/homa_card_spells_list.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_equipments_list.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_skills_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Skill> skills = [
      Skill(id: 'abcDEF', name: 'habilidade 1', description: 'Descricao da habilidade', effect: (){debugPrint('Efeito!!!');}),
    ];
    final List<Equipment> equipments = [
      Equipment(id: 'abcDEF1', name: 'Capacete', description: 'Descrição do equipamento fica aqui.', attributes: Attributes(), position: EquipmentPosition.head,),
      Equipment(id: 'abcDEF2', name: 'Botas', description: 'Descrição do equipamento fica aqui.', attributes: Attributes(), position: EquipmentPosition.foots,),
    ];
    final List<Spell> spells = [
      Spell(id: 'abcDEF1', name: 'Fogo', description: 'Cria fogo para luminar ou atacar.', manaConsume: 2, effect: (){},),
      Spell(id: 'abcDEF2', name: 'Símbolos', description: 'Permite traduzir linguagens desconhecidas.', manaConsume: 1, effect: (){},),
    ];

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

            ],
          ),
        ),
      ),
    );
  }
}