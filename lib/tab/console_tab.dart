import 'package:examen_u1/utils/console_tile.dart';
import 'package:flutter/material.dart';

class ConsoleTab extends StatelessWidget {
  final void Function(String, String, dynamic, String) onAddToCart;
  ConsoleTab({super.key, required this.onAddToCart});

  final List consoleOnSale = [
    ['Xbox Series X', '648', Colors.amber, 'lib/images/xbox_sx.webp', 'Amazon'],
    ['Play 5', '469', Colors.red, 'lib/images/play5.webp', 'Amazon'],
    ['Nintendo Switch 2', '329', Colors.green, 'lib/images/nintendoswitch2.webp', 'AliExpress'],
    ['Steam Deck', '784', Colors.blueAccent, 'lib/images/steam_deck.webp', 'Mercado Libre'],

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.5),
      itemCount: consoleOnSale.length,
      itemBuilder: (context, index) {
        return ConsoleTile(
          consoleType: consoleOnSale[index][0],
          consolePrice: consoleOnSale[index][1],
          consoleColor: consoleOnSale[index][2],
          consoleImagePath: consoleOnSale[index][3],
          consoleProvider: consoleOnSale[index][4],
          onPressed: () => onAddToCart(
            consoleOnSale[index][0],
            consoleOnSale[index][1],
            consoleOnSale[index][2],
            consoleOnSale[index][3],
          ),
        );
      },
    );
  }
}