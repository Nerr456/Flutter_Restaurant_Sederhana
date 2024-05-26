import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'food_menu.dart';
import 'cart_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Selamat datang di flutter!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuPage()),
                );
              },
              child: const Text('Menu'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
              child: const Text('About'),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String restaurantExteriorUrl =
      'https://img.freepik.com/premium-photo/tables-with-chairs-stand-front-old-restaurant-caption-regina-del-gusto_278455-18710.jpg?w=740';
  String restaurantInteriorUrl =
      'https://img.freepik.com/premium-photo/unconventional-workspace-with-quirky-decor-including-beanbag-chairs-hammocks-indoor-swings-perfe_964444-19657.jpg?w=360';
  String restaurantName = 'Warung Makan Maco';
  String restaurantLocation = 'jalan Mayor Oking Pegangsaan Timur 2';
  String mapsUrl =
      'https://www.google.com/maps/place/Rumah+Makan+Padang+-+Malah+Dicubo/@-6.9059116,107.5705301,13z/data=!4m10!1m2!2m1!1srumah+makan+padang+bandung!3m6!1s0x2e68e63b75344ed5:0xb19a04f363b58997!8m2!3d-6.9156463!4d107.6028304!15sChpydW1haCBtYWthbiBwYWRhbmcgYmFuZHVuZ1ocIhpydW1haCBtYWthbiBwYWRhbmcgYmFuZHVuZ5IBEXBhZGFuZ19yZXN0YXVyYW50mgEkQ2hkRFNVaE5NRzluUzBWSlEwRm5TVVF0YzAwemNUaFJSUkFC4AEA!16s%2Fg%2F1pzqkf5qm?entry=ttu';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurantName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text('Foto Luar Restoran'),
              SizedBox(height: 8),
              Image.network(restaurantExteriorUrl),
              SizedBox(height: 16),
              Text('Foto Dalam Restoran'),
              SizedBox(height: 8),
              Image.network(restaurantInteriorUrl),
              SizedBox(height: 16),
              Text(
                'Lokasi:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(restaurantLocation),
              SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () async {
                  await launch(mapsUrl);
                },
                icon: Icon(Icons.map),
                label: Text('Buka di Google Maps'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<CartItem> _cartItems = [];
  void addToCart(FoodMenu foodMenu) {
    setState(() {
      _cartItems.add(CartItem(foodMenu: foodMenu, Quantity: 1));
    });
  }

  List<FoodMenu> foodMenus = [
    FoodMenu(
        imageUrl:
            'https://images.unsplash.com/photo-1676300185292-e23bb3db50fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
        name: 'Steak',
        price: 75000),
    FoodMenu(
        imageUrl:
            'https://img.freepik.com/free-photo/almond-banana-pancake_1339-5294.jpg?t=st=1716652443~exp=1716656043~hmac=6f5bf9c3df875e472f9ab0f88e0109296eaddfbb8e2814a402a51304c8b3d318&w=1060',
        name: 'pisang bakar',
        price: 50000),
    FoodMenu(
        imageUrl:
            'https://img.freepik.com/free-photo/sauteed-chicken-with-mushrooms_2829-12875.jpg?t=st=1716652546~exp=1716656146~hmac=c76590316044f0e4e222ea66fc19f27843cc3737414e90d3f22203046f731b79&w=1060',
        name: 'jamur goreng',
        price: 50000),
    FoodMenu(
        imageUrl:
            'https://img.freepik.com/free-photo/sweet-buns-placed-wooden-board_114579-88852.jpg?t=st=1716652712~exp=1716656312~hmac=114e7f0eb7ad95a20d1dfbca4815c7545b5400432c513a15b7889b3cbee7fff9&w=1060',
        name: 'Roti Bakar',
        price: 55000),
  ];

  List<CartItem> CartItems = [];
  List<CartItem> _CartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartDialog(
                          cartItems: _CartItems,
                        )),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
          itemCount: foodMenus.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodDetailPage(
                      foodMenu: foodMenus[index],
                      addToCart: addToCart,
                      cartItems: _CartItems,
                    ),
                  ),
                );
              },
              child: Card(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        foodMenus[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        foodMenus[index].name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text('Rp ${foodMenus[index].price.toStringAsFixed(0)}'),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class FoodDetailPage extends StatelessWidget {
  final FoodMenu foodMenu;
  final List<CartItem> cartItems;
  final void Function(FoodMenu) addToCart;
  FoodDetailPage({
    Key? key,
    required this.foodMenu,
    required this.addToCart,
    required this.cartItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodMenu.name),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartDialog(
                          cartItems: cartItems,
                        )),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(foodMenu.imageUrl),
            const SizedBox(height: 20),
            Text(
              foodMenu.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text('Rp ${foodMenu.price.toStringAsFixed(0)}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addToCart(foodMenu);
                Navigator.pop(context);
              },
              child: const Text('Tambah ke Keranjang'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartDialog extends StatelessWidget {
  final List<CartItem> cartItems;

  const CartDialog({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(cartItems[index].foodMenu.imageUrl),
            title: Text(cartItems[index].foodMenu.name),
            subtitle: Text(
                'Rp ${cartItems[index].foodMenu.price.toStringAsFixed(0)} x ${cartItems[index].Quantity}'),
            trailing: Text(
                'Rp ${(cartItems[index].foodMenu.price * cartItems[index].Quantity).toStringAsFixed(0)}'),
          );
        },
      ),
    );
  }
}
