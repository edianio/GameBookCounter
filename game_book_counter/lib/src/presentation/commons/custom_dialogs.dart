import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/domain/attributes/entity/attributes.dart';
import 'package:game_book_counter/src/domain/skill/entity/skill.dart';
import 'package:game_book_counter/src/domain/spell/entity/spell.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/commons/forms/add_skill_form.dart';
import 'package:game_book_counter/src/presentation/commons/forms/add_spell_form.dart';
import 'package:game_book_counter/src/presentation/commons/forms/attributes_form.dart';
import 'package:game_book_counter/src/presentation/commons/forms/create_skill_form.dart';
import 'package:game_book_counter/src/presentation/commons/forms/create_spell_form.dart';
import 'package:game_book_counter/src/presentation/commons/loading_indicator.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skills_state.dart';
import 'package:game_book_counter/src/presentation/skills/bloc/skills_bloc.dart';
import 'package:game_book_counter/src/presentation/spells/bloc/spells_bloc.dart';
import 'package:game_book_counter/src/presentation/spells/bloc/spells_state.dart';

class CustomDialogs {
  void showMessageDialog(BuildContext context, String title, String message) async =>
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ParamsConst.defaultBorderRadius),
            ),
            content: Text(message),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(AppText.close),
              ),
            ],
          );
        },
      );

  Future<Attributes> showAttributesDialog(BuildContext context) async =>
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(AppText.attributes),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ParamsConst.defaultBorderRadius),
            ),
            content: AttributesForm(
              onConfirm: (data) => Navigator.of(context).pop(data),
            ),
          );
        },
      );

  Future<Skill?> showCreateSkillDialog(BuildContext context) async =>
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text(AppText.createSkill),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ParamsConst.defaultBorderRadius),
            ),
            content: CreateSkillForm(
              onConfirm: (data) => Navigator.of(context).pop(data),
              onClose: () => Navigator.of(context).pop(null),
            ),
          );
        },
      );

  Future<Skill?> showAddSkillToPlayerDialog(BuildContext context) async =>
      await showDialog(
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
                    borderRadius: BorderRadius.circular(ParamsConst.defaultBorderRadius),
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

  Future<Spell?> showCreateSpellDialog(BuildContext context) async =>
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text(AppText.createSpell),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ParamsConst.defaultBorderRadius),
            ),
            content: CreateSpellForm(
              onConfirm: (data) => Navigator.of(context).pop(data),
              onClose: () => Navigator.of(context).pop(null),
            ),
          );
        },
      );

  Future<Spell?> showAddSpellToPlayerDialog(BuildContext context) async =>
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          final bloc = getIt<SpellsBloc>();
          bloc.init();
          return BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              if (state is SpellsLoadedState) {
                return AlertDialog(
                  title: const Text(AppText.addSkill),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ParamsConst.defaultBorderRadius),
                  ),
                  content: AddSpellForm(
                    spells: state.spells,
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
