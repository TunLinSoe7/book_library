import 'package:flutter/material.dart';
import 'package:library_book/pages/my_home_page.dart';

import '../pages/library_page.dart';

enum HomeTab{
     ebooks,
     audiobooks,
}
enum LibraryTab{
     yourBooks,
     yourShelf,
}enum BottomNav{
     homePage,
     libraryPage,
}

extension HomePageTab on HomeTab{
        Tab get tabTitle{
          switch (this) {
            case  HomeTab.ebooks:
              return const Tab(text: "E books",);
            case HomeTab.audiobooks:
              return const Tab(text: "AudioBooks",);
            default:
              return const Tab(text: '',);}
        }
}
extension LibraryPageTab on LibraryTab{
        Tab get tabTitle{
          switch (this) {
            case  LibraryTab.yourBooks:
              return const Tab(text: "Your Books",);
            case LibraryTab.yourShelf:
              return const Tab(text: "Your Shelf",);
            default:
              return const Tab(text: '',);}
        }
}
extension BottomNavBar on BottomNav{
        Widget get bottomNavBarTitle{
          switch (this) {
            case  BottomNav.homePage:
              return const MyHomePage();
            case BottomNav.libraryPage:
              return const LibraryPage();
            default:
              return const SizedBox();}
        }
}

