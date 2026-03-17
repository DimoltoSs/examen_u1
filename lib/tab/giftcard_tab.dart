import 'package:examen_u1/utils/giftcard_tile.dart';
import 'package:flutter/material.dart';

class GiftcardTab extends StatelessWidget {
  final void Function(String, String, dynamic, String) onAddToCart;
  GiftcardTab({super.key, required this.onAddToCart});

  final List giftcardOnSale = [
    ['Xbox GiftCard', '25', Colors.deepPurple, 'lib/images/gift_card_xbox.webp', 'Amazon'],
    ['Playstation GiftCard', '100', Colors.lime, 'lib/images/gift_card_play.webp', 'Amazon'],
    ['Nintendo GiftCard', '50', Colors.pinkAccent, 'lib/images/gift_card_nintendo.webp', 'AliExpress'],
    ['Roblox GiftCard', '10', Colors.tealAccent, 'lib/images/gift_card_roblox.webp', 'Mercado Libre'],

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.5),
      itemCount: giftcardOnSale.length,
      itemBuilder: (context, index) {
        return GiftcardTile(
          giftcardName: giftcardOnSale[index][0],
          giftcardPrice: giftcardOnSale[index][1],
          giftcardColor: giftcardOnSale[index][2],
          giftcardImagePath: giftcardOnSale[index][3],
          giftcardProvider: giftcardOnSale[index][4],
          onPressed: () => onAddToCart(
            giftcardOnSale[index][0],
            giftcardOnSale[index][1],
            giftcardOnSale[index][2],
            giftcardOnSale[index][3],
          ),
        );
      },
    );
  }
}