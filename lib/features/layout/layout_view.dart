import 'package:evently_app/core/theme/colors_app.dart';
import 'package:evently_app/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../createEvent/create_new_event_view.dart';
import 'favorites/favorites_view.dart';

import 'home_tab.dart';
import 'map/map_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int selectedIndex = 0;

  List<Widget> screens = [
    const HomeTab(),
    const MapView(),
    const FavoritesView(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(
            side: BorderSide(
          color: ColorsApp.white,
          width: 5,
        )),
        backgroundColor: ColorsApp.secondColorLight,
        onPressed: () {
         Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateNewEventView()),
            );
        },
        child: const Icon(
          Icons.add,
          color: ColorsApp.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: ColorsApp.secondColorLight,
        selectedItemColor: ColorsApp.white,
        unselectedItemColor: ColorsApp.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(
                selectedIndex == 0
                    ? "assets/icons/selcted_home_icn.png"
                    : "assets/icons/un_selcted_home_icn.png",
              )),
              label: local.home),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(
              selectedIndex == 1
                  ? "assets/icons/selected_map_icn.png"
                  : "assets/icons/un_selected_map_icn.png",
            )),
            label: local.map,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(
              selectedIndex == 2
                  ? "assets/icons/selected_favorite_icn.png"
                  : "assets/icons/un_selected_favorite_icn.png",
            )),
            label: local.favorites,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(
              selectedIndex == 3
                  ? "assets/icons/selected_user_icn.png"
                  : "assets/icons/un_selected_user_icn.png",
            )),
            label: local.profile,
          ),
        ],
      ),
      body: screens[selectedIndex],
    );
  }
}
