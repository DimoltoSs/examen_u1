import 'package:flutter/material.dart';

class GiftcardTile extends StatelessWidget {
  final String giftcardName;
  final String giftcardPrice;
  final dynamic giftcardColor;
  final String giftcardImagePath;
  final String giftcardProvider;
  final void Function()? onPressed;

  const GiftcardTile({
    super.key,
    required this.giftcardName,
    required this.giftcardPrice,
    required this.giftcardColor,
    required this.giftcardImagePath,
    required this.giftcardProvider,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: giftcardColor[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  decoration: BoxDecoration(
                    color: giftcardColor[200],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                  ),
                  child: Text('\$$giftcardPrice',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: giftcardColor[800])),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Image.asset(giftcardImagePath),
            ),
            Text(giftcardName,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 4),
            Text(giftcardProvider, style: TextStyle(color: Colors.grey[600])),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite, color: Colors.pink[400]),
                  GestureDetector(
                    onTap: onPressed,
                    child: const Text("ADD",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            decoration: TextDecoration.underline)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}