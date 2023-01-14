import 'package:flutter/material.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/presentation/main/base_page.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class AppGeneratedRoute {
  static Route<dynamic> route(RouteSettings settings){

    switch(settings.name){
      case PageConst.root:
        return MaterialPageRoute(
          builder: (_) => const BasePage(),
          settings: settings,
        );
    //
    // case PageConst.adm:
    //   return MaterialPageRoute(
    //     builder: (_) => const AdmPage(),
    //     settings: settings,
    //   );
    //
    //   case PageConst.products:
    //     return MaterialPageRoute(
    //       builder: (_) => const ProductsPage(),
    //       settings: settings,
    //     );
    //
    // case PageConst.admEditProduct:
    //   return MaterialPageRoute(
    //     builder: (_) => EditProductAdmPage(product: settings.arguments as ProductEntity),
    //     settings: settings,
    //   );
    //
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
            borderRadius: BorderRadius.circular(32),
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