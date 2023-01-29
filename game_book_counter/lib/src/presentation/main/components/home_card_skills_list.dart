import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/domain/skill/entity/skill.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/commons/card_default.dart';
import 'package:game_book_counter/src/presentation/commons/loading_indicator.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_skills_list_item.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skill_event.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skill_state.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skills_bloc.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class HomeCardSkillsList extends StatefulWidget {
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
  State<HomeCardSkillsList> createState() => _HomeCardSkillsListState();
}

class _HomeCardSkillsListState extends State<HomeCardSkillsList> {
  late SkillsBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = getIt<SkillsBloc>();
    bloc.add(GetAllSkillsEvent());
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
          BlocBuilder<SkillsBloc, SkillState>(
            bloc: bloc,
            builder: (context, state){
              if (state is SkillsLoadedState) {
                if(state.skills.isEmpty){
                  return FractionallySizedBox(
                    widthFactor: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: () => widget.onTapAddSkill(),
                        child: const Text(AppText.addSkill),
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: state.skills.length,
                  itemBuilder: (context, index){
                    if (state.skills.isEmpty) {
                      return Container();
                    }
                    return HomeCardSkillsListItem(skill: state.skills[index]);
                  },
                );
              }
              return const LoadingIndicator();
            },
          ),
          // FractionallySizedBox(
          //   widthFactor: 1,
          //   child: Padding(
          //     padding: const EdgeInsets.all(16),
          //     child: ElevatedButton(
          //       onPressed: () => onTapAddSkill(),
          //       child: const Text(AppText.addSkill),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
