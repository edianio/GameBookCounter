import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/commons/error_indicator_card.dart';
import 'package:game_book_counter/src/presentation/commons/loading_indicator.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skills_bloc.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skills_event.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skills_state.dart';
import 'package:game_book_counter/src/presentation/skills/pages/components/skills_list_item.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({Key? key}) : super(key: key);

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  late SkillsBloc bloc;
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc = getIt<SkillsBloc>();
    bloc.add(GetAllSkillsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppText.skills),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(PageConst.addSkill),
        backgroundColor: ColorTable.primary,
        child: const Icon(Icons.add, color: Colors.white,),
      ),
      body: BlocBuilder<SkillsBloc, SkillsState>(
        bloc: bloc,
        builder: (context, state) {
          if(state is SkillsLoadingState){
            return const LoadingIndicator();
          }
          if(state is SkillsLoadedState) {
            return CustomScrollView(
              controller: controller,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return SkillsListItem(skill: state.skills[index]);
                    },
                    childCount: state.skills.length,
                  ),
                ),
              ],
            );
          }
          return ErrorIndicatorCard(error: (state as SkillsExceptionState).error);
        },
      ),
    );
  }
}
