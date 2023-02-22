import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/skill/entity/skill.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/commons/card_default.dart';
import 'package:game_book_counter/src/presentation/commons/custom_dialogs.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_skills_list_item.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skills_bloc.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skills_state.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class HomeCardSkillsList extends StatefulWidget {
  final List<Skill> skills;
  final VoidCallback onTapCreateSkill;
  final Function(Skill?) onTapAddSkill;
  final Function(Skill) onTapRemoveSkill;

  const HomeCardSkillsList(
      {required this.skills,
      required this.onTapCreateSkill,
      required this.onTapAddSkill,
      required this.onTapRemoveSkill,
      Key? key})
      : super(key: key);

  @override
  State<HomeCardSkillsList> createState() => _HomeCardSkillsListState();
}

class _HomeCardSkillsListState extends State<HomeCardSkillsList> {
  late SkillsBloc skillBloc;

  @override
  void initState() {
    super.initState();
    skillBloc = getIt<SkillsBloc>();
    skillBloc.init();
  }

  @override
  void dispose() {
    skillBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CardDefault(
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
            itemCount: widget.skills.length,
            itemBuilder: (context, index){
              if (widget.skills.isEmpty) {
                return Container();
              }
              return HomeCardSkillsListItem(
                skill: widget.skills[index],
                onRemoveItem: () => widget.onTapRemoveSkill(widget.skills[index]),
              );
            },
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () async {
                      Skill? skill;
                      if (skillBloc.state is SkillsLoadedState) {
                        if ((skillBloc.state as SkillsLoadedState).skills.isNotEmpty) {
                          skill = await CustomDialogs().showAddSkillToPlayerDialog(context);
                        } else {
                          CustomDialogs().showMessageDialog(context, AppText.skills, AppText.emptyListMessage(AppText.skill));
                        }
                      }
                      widget.onTapAddSkill(skill);
                    },
                    child: const Text(AppText.add),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: widget.onTapCreateSkill,
                    child: const Text(AppText.create),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
