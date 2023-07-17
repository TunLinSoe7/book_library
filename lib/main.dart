import 'package:flutter/material.dart';
import 'package:library_book/bloc/home_page_bloc.dart';
import 'package:library_book/bloc/search_page_bloc.dart';
import 'package:library_book/constant/hive_constant.dart';
import 'package:library_book/pages/library_page.dart';
import 'package:library_book/pages/my_home_page.dart';
import 'package:library_book/pages/search_page.dart';
import 'package:library_book/view_items/home_page_view_items.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/vos/overview_vo/book_vo.dart';
import 'data/vos/overview_vo/buy_links_vo.dart';
import 'data/vos/overview_vo/list_vo.dart';
import 'data/vos/overview_vo/result_vo.dart';


void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(BooksVOAdapter());
  Hive.registerAdapter(BuyLinksVOAdapter());
  Hive.registerAdapter(ListsVOAdapter());
  Hive.registerAdapter(ResultsVOAdapter());
  await Hive.openBox<BooksVO>(kBoxNameForBook);
  await Hive.openBox<BuyLinksVO>(kBoxNameForBuyLinks);
  await Hive.openBox<ListsVO>(kBoxNameForList);
  await Hive.openBox<ResultsVO>(kBoxNameForResult);
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<HomePageBloc>(create: (_)=>HomePageBloc()),
      ChangeNotifierProvider<SearchPageBloc>(create: (_)=>SearchPageBloc()),
    ],child: const MyApp(),)
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const MyHomePage(),
      const LibraryPage()
    ];
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Library',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            padding: const EdgeInsets.only(top: 5,bottom: 5),
            child: Builder(
              builder: (context){
                return ListTileSearchView(
                    onTapFunction: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const SearchPage()));
                    });
              },
            ),
          ),
        ),
       body: Selector<HomePageBloc,int>(builder: (_,selectedIndex,__){
         return IndexedStack(
           index: selectedIndex,
           children: pages,
         );
       }, selector: (_,bloc)=>bloc.selectedIndex),
        bottomNavigationBar: Selector<HomePageBloc,int>(
          selector: (_,bloc)=>bloc.selectedIndex,
          builder: (_,selectedIndex,__){
            return  BottomNavigationBar(
              currentIndex:selectedIndex ,
              onTap: (index){
                Provider.of<HomePageBloc>(context,listen: false).setIndex(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.library_books),label: 'Library'),
              ],
            );
          },
        ),

      ),
    );
  }
}
