import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/spell/entity/spell.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/commons/card_default.dart';
import 'package:game_book_counter/src/presentation/commons/custom_dialogs.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_spells_list_item.dart';
import 'package:game_book_counter/src/presentation/spells/bloc/spells_bloc.dart';
import 'package:game_book_counter/src/presentation/spells/bloc/spells_state.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class HomeCardSpellsList extends StatefulWidget {
  final List<Spell> spells;
  final VoidCallback onTapCreateSpell;
  final Function(Spell?) onTapAddSpell;
  final Function(Spell) onTapRemoveSpell;

  const HomeCardSpellsList({
    required this.spells,
    required this.onTapCreateSpell,
    required this.onTapAddSpell,
    required this.onTapRemoveSpell,
    super.key,
  });

  @override
  State<HomeCardSpellsList> createState() => _HomeCardSpellsListState();
}

class _HomeCardSpellsListState extends State<HomeCardSpellsList> {
  late SpellsBloc spellsBloc;

  @override
  void initState() {
    super.initState();
    spellsBloc = getIt<SpellsBloc>();
    spellsBloc.init();
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
                AppText.spells,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorTable.fontDefault),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: widget.spells.length,
            itemBuilder: (context, index){
              if (widget.spells.isEmpty) {
                return Container();
              }
              return HomeCardSpellsListItem(
                spell: widget.spells[index],
                onRemoveItem: () => widget.onTapRemoveSpell(widget.spells[index]),
              );
            },
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () async {
                      Spell? spell;
                      if (spellsBloc.state is SpellsLoadedState) {
                        if ((spellsBloc.state as SpellsLoadedState).spells.isNotEmpty) {
                          spell = await CustomDialogs().showAddSpellToPlayerDialog(context);
                        } else {
                          CustomDialogs().showMessageDialog(context, AppText.spells, AppText.emptyListMessage(AppText.spell));
                        }
                      }
                      widget.onTapAddSpell(spell);
                    },
                    child: const Text(AppText.add),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: widget.onTapCreateSpell,
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
