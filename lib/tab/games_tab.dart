import 'package:examen_u1/utils/games_tile.dart';
import 'package:flutter/material.dart';

class GamesTab extends StatelessWidget {
  final void Function(String, String, dynamic, String) onAddToCart;
  GamesTab({super.key, required this.onAddToCart});

  final List gamesOnSale = [
    ['The Last of Us Part 1', '43', Colors.deepPurple, 'lib/images/tlou1.webp', 'Amazon'],
    ['Clair Obscure: Expedition 33', '49', Colors.lime, 'lib/images/expedition_33.webp', 'Amazon'],
    ['Halo Infinite', '58', Colors.pinkAccent, 'lib/images/halo_infinite.webp', 'AliExpress'],
    ['God Of War Ragnarok', '784', Colors.brown, 'lib/images/god_of_war_ragnarok.webp', 'Mercado Libre'],

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.5),
      itemCount: gamesOnSale.length,
      itemBuilder: (context, index) {
        return GamesTile(
          gamesName: gamesOnSale[index][0],
          gamesPrice: gamesOnSale[index][1],
          gamesColor: gamesOnSale[index][2],
          gamesImagePath: gamesOnSale[index][3],
          gamesProvider: gamesOnSale[index][4],
          onPressed: () => onAddToCart(
            gamesOnSale[index][0],
            gamesOnSale[index][1],
            gamesOnSale[index][2],
            gamesOnSale[index][3],
          ),
        );
      },
    );
  }
}