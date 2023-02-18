import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/spell/entity/spell.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/presentation/commons/card_default.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_spells_list_item.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class HomeCardSpellsList extends StatelessWidget {
  final List<Spell> spells;
  final VoidCallback onTapCreateSpell;
  final VoidCallback onTapAddSpell;
  final Function(Spell) onTapRemoveSpell;

  const HomeCardSpellsList({
    required this.spells,
    required this.onTapCreateSpell,
    required this.onTapAddSpell,
    required this.onTapRemoveSpell,
    super.key,
  });

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
                AppText.spells,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorTable.fontDefault),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: spells.length,
            itemBuilder: (context, index){
              if (spells.isEmpty) {
                return Container();
              }
              return HomeCardSpellsListItem(
                spell: spells[index],
                onRemoveItem: () => onTapRemoveSpell(spells[index]),
              );
            },
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: onTapAddSpell,
                    child: const Text(AppText.add),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: onTapCreateSpell,
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
