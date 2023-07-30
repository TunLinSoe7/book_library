import 'package:flutter/material.dart';
import 'package:library_book/bloc/home_page_bloc.dart';
import 'package:library_book/bloc/library_page_bloc.dart';
import 'package:library_book/bloc/search_page_bloc.dart';
import 'package:library_book/bloc/shelf_page_bloc.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/constant/hive_constant.dart';
import 'package:library_book/data/vos/overview_vo/detail_vo.dart';
import 'package:library_book/data/vos/overview_vo/shelf_hive_vo.dart';
import 'package:library_book/data/vos/overview_vo/shelf_vo.dart';
import 'package:library_book/extensions/extension.dart';
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
  Hive.registerAdapter(DetailVOAdapter());
  Hive.registerAdapter(ShelfVOAdapter());
  Hive.registerAdapter(ShelfHiveVOAdapter());

  await Hive.openBox<BooksVO>(kBoxNameForBook);
  await Hive.openBox<BuyLinksVO>(kBoxNameForBuyLinks);
  await Hive.openBox<ListsVO>(kBoxNameForList);
  await Hive.openBox<ResultsVO>(kBoxNameForResult);
  await Hive.openBox<DetailVO>(kBoxNameForDetail);
  await Hive.openBox<ShelfVO>(kBoxNameForShelf);
  await Hive.openBox<ShelfHiveVO>(kBoxNameForShelfHiveVO);

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<HomePageBloc>(create: (_)=>HomePageBloc()),
      ChangeNotifierProvider<SearchPageBloc>(create: (_)=>SearchPageBloc()),
      ChangeNotifierProvider<LibraryPageBloc>(create: (_)=>LibraryPageBloc()),
      ChangeNotifierProvider<ShelfPageBloc>(create: (_)=>ShelfPageBloc()),

    ],child: const MyApp(),)
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.only(top: kSP5X,bottom: kSP5X),
            child: Builder(
              builder: (context){
                return ListTileSearchView(
                    onTapFunction: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  const SearchPage()));
                    });
              },
            ),
          ),
        ),
       body: Selector<HomePageBloc,int>(builder: (_,selectedIndex,__){
         return IndexedStack(
           index: selectedIndex,
           children: BottomNav.values.map((e) => e.bottomNavBarTitle).toList(),
         );
       }, selector: (_,bloc)=>bloc.selectedIndex),
        bottomNavigationBar: Selector<HomePageBloc,int>(
          selector: (_,bloc)=>bloc.selectedIndex,
          builder: (_,selectedIndex,__){
            return  BottomNavigationBar(
              currentIndex:selectedIndex ,
              onTap: (index){
                context.read<HomePageBloc>().setIndex(index);
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
