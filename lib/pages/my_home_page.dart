import 'package:flutter/material.dart';
import 'package:library_book/bloc/home_page_bloc.dart';
import 'package:library_book/data/vos/overview_vo/result_vo.dart';
import 'package:library_book/pages/ebook_page.dart';
import 'package:provider/provider.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
     List<Tab> homeTags = [
       const Tab(text: 'Ebooks',),
       const Tab(text: 'Audiobooks',)
     ];

    return DefaultTabController(
      length: homeTags.length,
      child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                  tabs: homeTags),
            ),
             Selector<HomePageBloc,ResultsVO?>(
               selector: (_,bloc)=>bloc.resultsVO,
               builder: (_,bookData,__){
                 return Expanded(
                   child: SizedBox(
                     child:  TabBarView(children: [
                        EBookPage(listVO: bookData?.lists),
                       Container(),
                     ]),
                   ),
                 );
               },
             ),
          ],
        ),

    );
  }
}
