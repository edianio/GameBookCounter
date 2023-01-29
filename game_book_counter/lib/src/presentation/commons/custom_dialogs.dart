import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/domain/attributes/entity/attributes.dart';
import 'package:game_book_counter/src/domain/skill/entity/skill.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/commons/forms/add_skill_form.dart';
import 'package:game_book_counter/src/presentation/commons/forms/attributes_form.dart';
import 'package:game_book_counter/src/presentation/commons/forms/create_skill_form.dart';
import 'package:game_book_counter/src/presentation/commons/loading_indicator.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skill_state.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skills_bloc.dart';

class CustomDialogs {
  Future<Attributes> showAttributesDialog(BuildContext context) async => await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(AppText.attributes),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            content: AttributesForm(
              onConfirm: (data) => Navigator.of(context).pop(data),
            ),
          );
        },
      );

  Future<Skill?> showCreateSkillDialog(BuildContext context) async => await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: const Text(AppText.createSkill),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        content: CreateSkillForm(
          onConfirm: (data) => Navigator.of(context).pop(data),
          onClose: () => Navigator.of(context).pop(null),
        ),
      );
    },
  );

  Future<Skill?> showAddSkillToPlayerDialog(BuildContext context) async => await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          final bloc = getIt<SkillsBloc>();
          bloc.init();
          return BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is SkillsLoadedState) {
                  return AlertDialog(
                    title: const Text(AppText.addSkill),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    content: AddSkillForm(
                      skills: state.skills,
                      onConfirm: (data) => Navigator.of(context).pop(data),
                      onClose: () => Navigator.of(context).pop(null),
                    ),
                  );
                }
                return const LoadingIndicator();
              },
          );
        },
      );
}