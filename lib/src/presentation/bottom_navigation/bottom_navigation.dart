import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:starinvest/src/common/colors.dart';
import 'package:starinvest/src/common/fonts_family.dart';
import 'package:starinvest/src/common/icon_paths.dart';
import 'package:starinvest/src/common/image_paths.dart';
import 'package:starinvest/src/common/widgets/text_form_field.dart';
import 'package:starinvest/src/presentation/home/home_screen.dart';
import 'package:starinvest/src/presentation/market/market_screen.dart';
import 'package:starinvest/src/presentation/news/news_screen.dart';
import 'package:starinvest/src/presentation/portfolio/portfolio_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  int _marketTabIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  List<Widget> _widgetOptions({int marketTabIndex = 0}) => <Widget>[
        HomeScreen(onTapTrending: _onTapTrending),
        MarketScreen(initialTab: marketTabIndex),
        const PortfolioScreen(),
        const NewsScreen(),
        const Center(child: Text('Profile', style: optionStyle)),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _marketTabIndex = 0;
      _selectedIndex = index;
    });
  }

  void _onTapTrending() {
    setState(() {
      _marketTabIndex = 1;
      _selectedIndex = 1;
    });
  }

  String appBarTitle(int selectedIndex) {
    switch (selectedIndex) {
      case 1:
        return "Market";

      case 2:
        return "Portfolio";

      case 3:
        return "News & Update";

      case 4:
        return "Profile";

      case 5:
        return "News";

      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ConstColors.baseColorDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: _selectedIndex == 0
            ? Image.asset(
                ImagePaths.general.logo,
                height: 30,
              )
            : Text(
                appBarTitle(_selectedIndex),
                style: const TextStyle(
                  fontFamily: poppinsMedium,
                  fontSize: 16,
                  color: ConstColors.light,
                ),
              ),
        actions: [
          Image.asset(
            IconPaths.home.message,
            height: 40,
            width: 40,
          ),
          const Gap(10),
          Image.asset(
            IconPaths.home.notifications,
            height: 40,
            width: 40,
          ),
          const Gap(15),
        ],
        bottom: _selectedIndex == 2
            ? null
            : PreferredSize(
                preferredSize: const Size.fromHeight(82),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormFieldWidget.height50(
                    'Search',
                    textAlign: TextAlign.start,
                    readOnly: true,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: ConstColors.white,
                    ),
                    fillColor: ConstColors.white.withValues(alpha: 0.2),
                    textColor: ConstColors.gray20,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    focusBorderColor: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    suffixIcon: SizedBox(
                      width: 50,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 1,
                            height: 20,
                            color: ConstColors.white.withValues(alpha: 0.2),
                          ),
                          const Icon(
                            Icons.tune,
                            color: ConstColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 0.8,
            colors: [
              ConstColors.lightgreen.withValues(alpha: .8),
              ConstColors.baseColorDark,
            ],
          ),
        ),
        child: _widgetOptions(marketTabIndex: _marketTabIndex)[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0C0C0C),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Image.asset(
                IconPaths.general.homeBottomNav,
                width: 20,
                height: 20,
                color: _selectedIndex == 0 ? ConstColors.lightgreen : null,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Image.asset(
                IconPaths.general.marketBottomNav,
                width: 20,
                height: 20,
                color: _selectedIndex == 1 ? ConstColors.lightgreen : null,
              ),
            ),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Image.asset(
                IconPaths.general.portfolioBottomNav,
                width: 20,
                height: 20,
                color: _selectedIndex == 2 ? ConstColors.lightgreen : null,
              ),
            ),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Image.asset(
                IconPaths.general.newsBottomNav,
                width: 20,
                height: 20,
                color: _selectedIndex == 3 ? ConstColors.lightgreen : null,
              ),
            ),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Image.asset(
                IconPaths.general.profileBottomNav,
                width: 20,
                height: 20,
                color: _selectedIndex == 4 ? ConstColors.lightgreen : null,
              ),
            ),
            label: 'Profile',
          ),
        ],
        selectedItemColor: ConstColors.lightgreen,
        selectedLabelStyle: const TextStyle(
          fontFamily: poppinsRegular,
          fontSize: 12,
        ),
        unselectedItemColor: ConstColors.gray,
        unselectedLabelStyle: const TextStyle(
          fontFamily: poppinsRegular,
          fontSize: 12,
        ),
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}
