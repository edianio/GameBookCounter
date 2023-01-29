import 'package:game_book_counter/src/domain/skill/repository/skill_repository.dart';
import 'package:game_book_counter/src/domain/skill/use_cases/add_skill.dart';
import 'package:game_book_counter/src/domain/skill/use_cases/get_all_skills.dart';
import 'package:game_book_counter/src/external/datasource/skill/skill_datasource_hive.dart';
import 'package:game_book_counter/src/infra/skill/datasource/skill_datasource.dart';
import 'package:game_book_counter/src/infra/skill/repository/skill_repository_impl.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skills_bloc.dart';

void serviceLocatorSkills() {
  // DATASOURCE
  getIt.registerLazySingleton<SkillDatasource>(() => SkillDatasourceHive());
  // REPOSITORY
  getIt.registerLazySingleton<SkillRepository>(() => SkillRepositoryImpl(getIt()));
  // USE CASES
  getIt.registerLazySingleton<AddSkill>(() => AddSkill(getIt()));
  getIt.registerLazySingleton<GetAllSkills>(() => GetAllSkills(getIt()));
  // BLOC
  getIt.registerSingleton<SkillsBloc>(SkillsBloc(addSkill: getIt(), getAll: getIt()));
}