import 'package:flutter/material.dart';
import 'package:starinvest/src/common/icon_paths.dart';
import 'package:starinvest/src/presentation/home/home_screen.dart';
import 'package:starinvest/src/presentation/market/market_screen.dart';
import 'package:starinvest/src/presentation/portfolio/portfolio_screen.dart';

class BottomNavigationComponent extends StatelessWidget {
  const BottomNavigationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: BottomNavigationBarExample());
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MarketScreen(),
    PortfolioScreen(),
    Text('News', style: optionStyle),
    Text('Profile', style: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C0C0C),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0C0C0C),
        
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: const Color(0xFF0C0C0C),
              activeIcon: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(IconPaths.general.home),
              ),
              icon: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(IconPaths.general.homeInnactive),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xFF0C0C0C),
              activeIcon: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(IconPaths.general.market),
              ),
              icon: SizedBox(
              width: 50,
                height: 50,
                child: Image.asset(IconPaths.general.marketInnactive),
              ),
              label: 'Market'),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xFF0C0C0C),
              activeIcon: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(IconPaths.general.portfolio),
              ),
              icon: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(IconPaths.general.portfolioInnactive),
              ),
              label: 'Portfolio'),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xFF0C0C0C),
              activeIcon: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(IconPaths.general.news),
              ),
              icon: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(IconPaths.general.newsInnactive),
              ),
              label: 'News'),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xFF0C0C0C),
              activeIcon: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(IconPaths.general.profile),
              ),
              icon: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(IconPaths.general.profileInnactive),
              ),
              label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        showSelectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}
