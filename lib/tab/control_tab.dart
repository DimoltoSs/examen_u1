import 'package:examen_u1/utils/control_tile.dart';
import 'package:flutter/material.dart';

class ControlTab extends StatelessWidget {
  final void Function(String, String, dynamic, String) onAddToCart;
  ControlTab({super.key, required this.onAddToCart});

  final List controllerOnSale = [
    ['Xbox Controller Series X', '62', Colors.blue, 'lib/images/controller_xbox.webp', 'Amazon'],
    ['Play 5 Controller DualSense', '74', Colors.deepOrange, 'lib/images/controller_ps5.webp', 'Amazon'],
    ['Nintendo Switch 2 Controller', '27', Colors.green, 'lib/images/controller_sw2.webp', 'AliExpress'],
    ['Nintendo Switch 2 Joy Con', '107', Colors.blueAccent, 'lib/images/controller_joycon.png', 'Mercado Libre'],

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.5),
      itemCount: controllerOnSale.length,
      itemBuilder: (context, index) {
        return ControlTile(
          controllerName: controllerOnSale[index][0],
          controllerPrice: controllerOnSale[index][1],
          controllerColor: controllerOnSale[index][2],
          controllerImagePath: controllerOnSale[index][3],
          controllerProvider: controllerOnSale[index][4],
          onPressed: () => onAddToCart(
            controllerOnSale[index][0],
            controllerOnSale[index][1],
            controllerOnSale[index][2],
            controllerOnSale[index][3],
          ),
        );
      },
    );
  }
}