import 'package:flutter/material.dart';
import 'package:movies_app/Browse/browse_screen.dart';
import 'package:movies_app/Home/home_screen.dart';
import 'package:movies_app/search/search_screen.dart';
import 'package:movies_app/theme/My-theme.dart';
import 'package:movies_app/watchlist/watchlist_screen.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'home-screen';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
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
                icon: ImageIcon(AssetImage('assets/images/ic_home.png')),
                label: 'HOME',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/ic_search.png')),
                label: 'SEARCH',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/ic_browse.png')),
                label: 'BROWSE',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/ic_watch_list.png')),
                label: 'WATCHLIST',
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(child: tabs[selectedIndex]),
      ),
    );
  }

  List<Widget> tabs = [
    HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    WatchListScreen(),
  ];
}
