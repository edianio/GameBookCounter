import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/domain/spell/use_cases/add_spell.dart';
import 'package:game_book_counter/src/domain/spell/use_cases/get_all_spells.dart';
import 'package:game_book_counter/src/presentation/spells/bloc/spells_event.dart';
import 'package:game_book_counter/src/presentation/spells/bloc/spells_state.dart';

class SpellsBloc extends Bloc<SpellsEvent, SpellsState>{
  final AddSpell _addSpell;
  // final UpdateSpell _updateSpell;
  // final RemoveSpell _removeSpell;
  // final GetSpell _getSpell;
  final GetAllSpells _getAllSpells;

  SpellsBloc({required AddSpell addSpell, required GetAllSpells getAllSpells})
      : _addSpell = addSpell,
        _getAllSpells = getAllSpells,
        super(SpellsLoadingState()) {
    on<AddSpellEvent>(_add, transformer: sequential());
    on<GetAllSpellsEvent>(_getAll, transformer: sequential());
  }

  void init() async {
    add(GetAllSpellsEvent());
  }

  Future<void> _add(AddSpellEvent event, Emitter emit) async {
    await _addSpell(event.spell);
    add(GetAllSpellsEvent());
  }

  Future<void> _remove(RemoveSpellEvent event, Emitter emit) async {

  }

  Future<void> _update(UpdateSpellEvent event, Emitter emit) async {

  }

  Future<void> _getOne(GetSpellEvent event, Emitter emit) async {

  }

  Future<void> _getAll(GetAllSpellsEvent event, Emitter emit) async {
    emit(SpellsLoadingState());
    await emit.onEach(
      _getAllSpells(),
      onData: (data) {
        emit(SpellsLoadedState(spells: data));
      },
      onError: (e, s) {
        emit(SpellsExceptionState(e.toString()));
      },
    );
  }
}