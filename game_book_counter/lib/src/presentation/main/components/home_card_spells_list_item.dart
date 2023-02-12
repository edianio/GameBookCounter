import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/spell/entity/spell.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class HomeCardSpellsListItem extends StatelessWidget {
  final Spell spell;
  final VoidCallback onRemoveItem;

  const HomeCardSpellsListItem({required this.spell, required this.onRemoveItem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontStyle = Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorTable.fontDefault);

    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 2),
                child: Text(
                  spell.name,
                  style: fontStyle,
                ),
              ),
              if(spell.description != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 2, right: 16, left: 32, top: 2),
                  child: Text(
                    spell.description!,
                    style: fontStyle,
                  ),
                ),
              if(spell.itemConsume != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 2, right: 16, left: 32, top: 2),
                  child: Text(
                    '${AppText.itemConsume}: ${spell.itemConsume?.name}(${spell.itemConsume?.quantity})',
                    style: fontStyle,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16, right: 16, left: 32, top: 2),
                child: Text(
                  '${AppText.manaConsume}: ${spell.manaConsume}',
                  style: fontStyle,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onRemoveItem,
          padding: const EdgeInsets.all(16),
          icon: const Icon(
            Icons.delete_outline,
            color: ColorTable.warning,
          ),
        ),
      ],
    );
  }
}
