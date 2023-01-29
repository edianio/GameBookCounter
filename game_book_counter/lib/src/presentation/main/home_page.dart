import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/commons/bottom_nav_bar.dart';
import 'package:game_book_counter/src/presentation/commons/error_indicator_card.dart';
import 'package:game_book_counter/src/presentation/commons/loading_indicator.dart';
import 'package:game_book_counter/src/presentation/main/components/home_card_player_status.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_bloc.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PlayerBloc playerBloc;

  @override
  void initState() {
    super.initState();
    playerBloc = getIt();
    playerBloc.init();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Status'),
        centerTitle: true,
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          primary: true,
          child: BlocBuilder<PlayerBloc, PlayerState>(
            bloc: playerBloc,
            builder: (context, state){
              if (state is PlayerLoadedState) {
                if (state.player == null) {
                  return FractionallySizedBox(
                    widthFactor: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pushNamed(PageConst.addPlayer),
                        child: const Text(AppText.addPlayer),
                      ),
                    ),
                  );
                }
                return  Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    HomeCardPlayerStatus(player: state.player!),
                  ],
                );
              }
              if (state is PlayerExceptionState) {
                return ErrorIndicatorCard(error: state.error);
              }
              return const LoadingIndicator();
            },
          ),
        ),
      ),
    );
  }
}