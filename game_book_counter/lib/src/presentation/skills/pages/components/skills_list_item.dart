import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/skill/entity/skill.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class SkillsListItem extends StatelessWidget {
  final Skill skill;

  const SkillsListItem({required this.skill, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontStyle = Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorTable.fontDefault);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 2),
          child: Text(
            skill.name,
            style: fontStyle,
          ),
        ),
        if(skill.description != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 16, right: 16, left: 32, top: 2),
            child: Text(
              skill.description!,
              style: fontStyle,
            ),
          ),
      ],
    );
  }
}
