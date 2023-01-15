import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/skill/entity/skill.dart';
import 'package:game_book_counter/src/presentation/commons/bottom_nav_bar.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_skills_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Skill> skills = [Skill(id: 'abcDEF', name: 'habilidade 1', description: 'Descricao da habilidade', effect: (){debugPrint('Efeito!!!');})];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Título do jogo'),
        centerTitle: true,
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          primary: true,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

               HomeCardSkillsList(
                 skills: skills,
                 onTapAddSkill: (){},
                 onTapRemoveSkill: (){},
               ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}