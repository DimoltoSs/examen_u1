import 'package:examen_u1/utils/perifericos_tile.dart';
import 'package:flutter/material.dart';

class PerifericosTab extends StatelessWidget {
  final void Function(String, String, dynamic, String) onAddToCart;
  PerifericosTab({super.key, required this.onAddToCart});

  final List perifericoOnSale = [
    ['BlackShark V2', '43', Colors.indigo, 'lib/images/periferico_auricular.webp', 'Amazon'],
    ['Logitech G Pro LightSpeed 2', '74', Colors.deepOrange, 'lib/images/periferico_mause.webp', 'Amazon'],
    ['Rog Strix Scope Rx Eva 02', '129', Colors.teal, 'lib/images/periferico_teclado.webp', 'Amazon'],
    ['Artisan Zero', '171', Colors.blueAccent, 'lib/images/periferico_mausepad.webp', 'Mercado Libre'],

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.5),
      itemCount: perifericoOnSale.length,
      itemBuilder: (context, index) {
        return PerifericosTile(
          perifericosName: perifericoOnSale[index][0],
          perifericosPrice: perifericoOnSale[index][1],
          perifericosColor: perifericoOnSale[index][2],
          perifericosImagePath: perifericoOnSale[index][3],
          perifericosProvider: perifericoOnSale[index][4],
          onPressed: () => onAddToCart(
            perifericoOnSale[index][0],
            perifericoOnSale[index][1],
            perifericoOnSale[index][2],
            perifericoOnSale[index][3],
          ),
        );
      },
    );
  }
}