import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/skill/entity/skill.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_skills_list_item.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class HomeCardSkillsList extends StatelessWidget {
  final List<Skill> skills;
  final VoidCallback onTapAddSkill;
  final VoidCallback onTapRemoveSkill;

  const HomeCardSkillsList(
      {required this.skills,
      required this.onTapAddSkill,
      required this.onTapRemoveSkill,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: ColorTable.primary,
            width: 1,
          ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FractionallySizedBox(
              widthFactor: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 2),
                child: Text(
                  AppText.skills,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorTable.fontDefault),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: skills.length,
              itemBuilder: (context, index){
                if (skills.isEmpty) {
                  return Container();
                }
                return HomeCardSkillsListItem(skill: skills[index]);
              },
            ),
            FractionallySizedBox(
              widthFactor: 1,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () => onTapAddSkill(),
                  child: const Text(AppText.addSkill),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
