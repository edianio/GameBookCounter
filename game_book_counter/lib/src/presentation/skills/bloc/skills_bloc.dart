import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/domain/skill/use_cases/add_skill.dart';
import 'package:game_book_counter/src/domain/skill/use_cases/get_all_skills.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skills_event.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skills_state.dart';

class SkillsBloc extends Bloc<SkillsEvent, SkillsState>{
  final AddSkill addSkill;
  final GetAllSkills getAll;

  SkillsBloc({required this.addSkill, required this.getAll}) : super(SkillsLoadingState()){
    on<AddSkillEvent>(_addSkill, transformer: droppable());
    on<GetAllSkillsEvent>(_getAll, transformer: sequential());
  }

  void init() async {
    add(GetAllSkillsEvent());
  }

  Future<void> _addSkill(AddSkillEvent event, Emitter emit) async {
    await addSkill(event.skill);
    add(GetAllSkillsEvent());
  }

  Future<void> _getAll(GetAllSkillsEvent event, Emitter emit) async {
    emit(SkillsLoadingState());
    await emit.onEach(
      getAll(),
      onData: (data) {
        emit(SkillsLoadedState(skills: data));
      },
      onError: (e,s) {
        emit(SkillsExceptionState(e.toString()));
      },
    );
  }
}