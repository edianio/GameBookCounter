import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/player/entity/player_character.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/presentation/inventory/pages/inventory_page.dart';
import 'package:game_book_counter/src/presentation/items/pages/add_item_page.dart';
import 'package:game_book_counter/src/presentation/items/pages/items_page.dart';
import 'package:game_book_counter/src/presentation/main/base_page.dart';
import 'package:game_book_counter/src/presentation/player/pages/add_player_page.dart';
import 'package:game_book_counter/src/presentation/player/pages/player_page.dart';
import 'package:game_book_counter/src/presentation/skills/pages/add_skill_page.dart';
import 'package:game_book_counter/src/presentation/skills/pages/skills_page.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class AppGeneratedRoute {
  static Route<dynamic> route(RouteSettings settings){
    switch(settings.name){
      case PageConst.root:
        return MaterialPageRoute(
          builder: (_) => const BasePage(),
          settings: settings,
        );
      case PageConst.player:
        return MaterialPageRoute(
          builder: (_) => PlayerPage(player: settings.arguments as PlayerCharacter),
          settings: settings,
        );
      case PageConst.addPlayer:
        return MaterialPageRoute(
          builder: (_) => const AddPlayerPage(),
          settings: settings,
        );
      case PageConst.skills:
        return MaterialPageRoute(
          builder: (_) => const SkillsPage(),
          settings: settings,
        );
      case PageConst.addSkill:
        return MaterialPageRoute(
          builder: (_) => const AddSkillPage(),
          settings: settings,
        );
      case PageConst.inventory:
        return MaterialPageRoute(
          builder: (_) => const InventoryPage(),
          settings: settings,
        );
      case PageConst.items:
        return MaterialPageRoute(
          builder: (_) => const ItemsPage(),
          settings: settings,
        );
      case PageConst.addItem:
        return MaterialPageRoute(
          builder: (_) => const AddItemPage(),
          settings: settings,
        );
      default:
        return materialBuilder(widget: const ErrorPage());
    }
  }
}

class ErrorPage extends StatelessWidget{
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página não encontrada'),
      ),
      body: Center(
        child: Card(
          elevation: 1,
          margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ParamsConst.defaultBorderRadius),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                ClipRRect(
                  child: Icon(
                    Icons.warning_rounded,
                    size: 64,
                    color: ColorTable.warning,
                  ),
                ),

                SizedBox(height: 10,),

                Text('Ocorreu um erro inesperado! Por favor, aguarde para tentar novamente.\n'
                    '\nSe o problema persistir, entre em contato com o suporte técnico.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

MaterialPageRoute materialBuilder({required Widget widget}){
  return MaterialPageRoute(builder: (_) => widget);
}