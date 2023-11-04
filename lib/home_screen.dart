import 'package:flutter/material.dart';
import 'package:movies_app/browse/browse_categories_screen.dart';
import 'package:movies_app/home/movies_home.dart';
import 'package:movies_app/search/search_screen.dart';
import 'package:movies_app/utils/MyTheme.dart';
import 'package:movies_app/watchlist/watchlist_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: MyTheme.primaryLight,
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/Home_icon.png')),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/search_icon.png')),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/Browse_icon.png')),
                  label: 'Browse'),
              BottomNavigationBarItem(
                  icon:
                      ImageIcon(AssetImage('assets/images/watchlist_icon.png')),
                  label: 'WATCHLIST')
            ],
          ),
        ),
        body: SingleChildScrollView(child: tabs[selectedIndex]),
      ),
    );
  }

  List<Widget> tabs = [
    MoviesHomeScreen(),
    SearchScreen(),
    WatchlistScreen(),
    BrowseCategoriesScreen(),
  ];
}
