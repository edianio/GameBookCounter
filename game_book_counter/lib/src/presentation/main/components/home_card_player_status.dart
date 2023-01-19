import 'package:flutter/material.dart';
import 'package:game_book_counter/src/domain/player/entity/player_character.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:game_book_counter/src/presentation/commons/card_default.dart';
import 'package:game_book_counter/src/presentation/commons/simple_capsule_information.dart';
import 'package:game_book_counter/src/utils/color_table.dart';

class HomeCardPlayerStatus extends StatelessWidget {
  final PlayerCharacter player;
  const HomeCardPlayerStatus({required this.player, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontStyle = Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorTable.fontDefault);

    return CardDefault(
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(PageConst.player, arguments: player),
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FractionallySizedBox(
                widthFactor: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 2),
                  child: Text(
                    AppText.character,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorTable.fontDefault),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 2),
                child: Text(
                  player.alias != null ? '${player.alias}(${player.name})' : player.name,
                  style: fontStyle,
                ),
              ),
              if(player.description != null)
                Padding(
                  padding: const EdgeInsets.only(top: 2, right: 16, left: 32, bottom: 2),
                  child: Text(
                    player.description!,
                    style: fontStyle,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2, right: 16, left: 32, top: 2),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${AppText.level}: ${player.level}',
                      style: fontStyle,
                    ),
                    const SizedBox(width: 12,),
                    Text(
                      '${AppText.exp}: ${player.exp}',
                      style: fontStyle,
                    ),
                  ],
                ),
              ),
              if(player.job != null)
                ... [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2, right: 16, left: 32, top: 2),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '${AppText.job}: ${player.job?.name}',
                          style: fontStyle,
                        ),
                        const SizedBox(width: 12,),
                        Text(
                          '${AppText.level}: ${player.job?.level}',
                          style: fontStyle,
                        ),
                        const SizedBox(width: 12,),
                        Text(
                          '${AppText.exp}: ${player.job?.exp}',
                          style: fontStyle,
                        ),
                      ],
                    ),
                  ),
                  if(player.job?.description != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2, right: 16, left: 32, bottom: 2),
                      child: Text(
                        player.job!.description!,
                        style: fontStyle,
                      ),
                    ),
                ],
              Padding(
                padding: const EdgeInsets.only(bottom: 16, right: 16, left: 32, top: 2),
                child: Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: <Widget>[
                    SimpleCapsuleInformation('${AppText.life}: ${player.attributes.life}',),
                    SimpleCapsuleInformation('${AppText.mana}: ${player.attributes.mana}',),
                    SimpleCapsuleInformation('${AppText.attack}: ${player.attributes.attack}',),
                    SimpleCapsuleInformation('${AppText.defense}: ${player.attributes.defense}',),
                    SimpleCapsuleInformation('${AppText.luck}: ${player.attributes.luck}',),
                    SimpleCapsuleInformation('${AppText.speed}: ${player.attributes.speed}',),
                    SimpleCapsuleInformation('${AppText.intelligence}: ${player.attributes.intelligence}',),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
