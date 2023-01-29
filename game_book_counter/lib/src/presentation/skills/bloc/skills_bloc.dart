import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/domain/skill/use_cases/add_skill.dart';
import 'package:game_book_counter/src/domain/skill/use_cases/get_all_skills.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skill_event.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skill_state.dart';

class SkillsBloc extends Bloc<SkillEvent, SkillState>{
  final AddSkill addSkill;
  final GetAllSkills getAll;

  SkillsBloc({required this.addSkill, required this.getAll}) : super(SkillsLoadingState()){
    on<AddSkillEvent>(_addSkill, transformer: droppable());
    on<GetAllSkillsEvent>(_getAll, transformer: sequential());
  }

  Future<void> _addSkill(AddSkillEvent event, Emitter emit) async {
    await addSkill(event.skill).then(
      (data) {
        add(GetAllSkillsEvent());
      },
      onError: (e, s) {
        emit(SkillsExceptionState(e.toString()));
      },
    );
  }

  Future<void> _getAll(GetAllSkillsEvent event, Emitter emit) async {
    await getAll().then((data) {
      emit(SkillsLoadedState(skills: data));
    }).catchError((e, s) {
      emit(SkillsExceptionState(e.toString()));
    });
  }
}