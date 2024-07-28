import 'package:edupoto/home.dart';
import 'package:edupoto/product_info.dart';
import 'package:edupoto/search.dart';
import 'package:edupoto/settings.dart';
import 'package:edupoto/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define your custom primary color
    MaterialColor customPrimaryColor =
    const MaterialColor(0xFF000000, <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(0xFF000000),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: customPrimaryColor,
      ),
      home: SplashScreen(),
      // home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;


  final List<Widget> _pages = [
    // tribeTv(),
    Home(),
    ProductInfo(),
    Search(),
    Settings()
    // Add more screens here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // drawer: const Drawer(
      //   surfaceTintColor: Colors.black,
      //   child: MyDrawer(),
      // ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: const TextStyle(
            fontFamily: "Quicksand",
            fontWeight: FontWeight.bold
        ),
        selectedLabelStyle: const TextStyle(
            fontFamily: "Quicksand",
            fontWeight: FontWeight.bold
        ),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info_sharp), label: 'Product Information'),
          BottomNavigationBarItem(icon: Icon(Icons.search_sharp), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      )
      ,
    );
  }
}

