import 'package:examen_u1/models/cart_item.dart';
import 'package:examen_u1/screens/cart_page.dart';
import 'package:examen_u1/utils/my_tab.dart';
import 'package:flutter/material.dart';
import '../tab/console_tab.dart';
import '../tab/control_tab.dart';
import '../tab/games_tab.dart';
import '../tab/giftcard_tab.dart';
import '../tab/perifericos_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _cartItemCount = 0;
  List<CartItem> userCart = [];

  List<Widget> myTabs = [
    const MyTab(iconPath: 'lib/icons/consola.png', iconName: 'Consola'),
    const MyTab(iconPath: 'lib/icons/control.png', iconName: 'Control'),
    const MyTab(iconPath: 'lib/icons/gamesicoin.png', iconName: 'Gamesicon'),
    const MyTab(iconPath: 'lib/icons/perifericos.png', iconName: 'Periferico'),
    const MyTab(iconPath: 'lib/icons/tarjetaregalo.png', iconName: 'TarjetaR'),
  ];

  void addToCart(String name, String price, dynamic color, String image) {
    setState(() {
      userCart.add(CartItem(
        name: name,
        price: price,
        color: color,
        imagePath: image,
      ));
      _cartItemCount = userCart.length;
    });
  }

  void removeFromCart(int index) {
    setState(() {
      userCart.removeAt(index);
      _cartItemCount = userCart.length;
    });
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.menu, color: Colors.grey[800]),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person, color: Colors.grey[800]),
            ),
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Text('I want to ', style: TextStyle(fontSize: 24)),
                  Text('Play today', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, decoration: TextDecoration.underline))
                ],
              ),
            ),
            const SizedBox(height: 24),
            TabBar(tabs: myTabs),
            Expanded(
              child: TabBarView(
                children: [
                  ConsoleTab(onAddToCart: addToCart),
                  ControlTab(onAddToCart: addToCart),
                  GamesTab(onAddToCart: addToCart),
                  PerifericosTab(onAddToCart: addToCart),
                  GiftcardTab(onAddToCart: addToCart),
                  
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartPage(
                              cart: userCart,
                              onRemove: removeFromCart,
                            ),
                          ),
                        );
                      },
                      icon: Badge(
                        isLabelVisible: _cartItemCount > 0,
                        label: Text('$_cartItemCount'),
                        child: const Icon(
                          Icons.shopping_cart,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(
                            cart: userCart,
                            onRemove: removeFromCart,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 226, 109, 14)),
                    child: const Text('View Cart', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}