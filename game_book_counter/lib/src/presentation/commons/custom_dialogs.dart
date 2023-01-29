import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/attributes/entity/attributes.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/presentation/commons/forms/attributes_form.dart';

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
}