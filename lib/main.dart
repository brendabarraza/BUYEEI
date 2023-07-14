import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'carrito_page.dart';
import 'favorites_page.dart';
import 'puntos_page.dart';
import 'settings_page.dart';
import 'about_page.dart';
import 'favorites_provider.dart';
import 'pedidos_provider.dart';
import 'pedidos_page.dart';
import 'carrito_provider.dart';
import 'pago_provider.dart';
import 'puntos_provider.dart';
import 'login_page.dart';
import 'producto_provider.dart';
import 'especiales_page.dart';
import 'frutales_page.dart';
import 'cremosos_page.dart';
import 'tortas_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => PuntosProvider()),
        ChangeNotifierProvider(create: (_) => CarritoProvider()),
        //ChangeNotifierProvider(create: (_) => ProductoProvider()),
        ChangeNotifierProvider(create: (_) => PagoProvider()),
        ChangeNotifierProvider(create: (_) => PedidosProvider()),

        //ChangeNotifierProvider(create: (_) => CremososProvider()),
        //ChangeNotifierProvider(create: (_) => FrutalesProvider()),
        //ChangeNotifierProvider(create: (_) => TortasProvider()),
        //ChangeNotifierProvider(create: (_) => EspecialesProvider()),

      ],
      child: MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuadros de imágenes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/settings': (context) => SettingsPage(),
        '/about': (context) => AboutPage(),
        '/carrito': (context) => CarritoPage(),
        '/pedidos': (context) => PedidosPage(),
        '/especiales': (context) => EspecialesPage(),
        '/frutales': (context) => FrutalesPage(),
        '/tortas': (context) => TortasPage(),
        '/cremosos': (context) => CremososPage(),
      },
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  String _pageTitle = 'INICIO';

  final List<Widget> _pages = [
    HomePage(),
    CarritoPage(),
    FavoritesPage(),
    PuntosPage(userPoints: 0),
    PedidosPage(),
  ];

  List<String> _pageTitles = [
    'INICIO',
    'CARRITO',
    'FAVORITOS',
    'PUNTOS',
    'PEDIDOS',
  ];

  List<String> _selectedProducts = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageTitle = _pageTitles[index];
    });
  }

  void addToCart(String product) {
    setState(() {
      _selectedProducts.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    //List<String> _selectedFavorites = Provider.of<FavoritesProvider>(context).favoriteProducts;
    //List<String> _selectedPedidos = Provider.of<PedidosProvider>(context).pedidosProducts;

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF241E1E),
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF241E1E),
            icon: Icon(Icons.shopping_cart_rounded),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF241E1E),
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF241E1E),
            icon: Icon(Icons.tag_faces_outlined),
            label: 'Puntos',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
