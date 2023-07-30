import 'package:flutter/material.dart';
import 'package:library_book/bloc/home_page_bloc.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/data/vos/overview_vo/result_vo.dart';
import 'package:library_book/extensions/extension.dart';
import 'package:library_book/pages/ebook_page.dart';
import 'package:library_book/pages/search_page.dart';
import 'package:provider/provider.dart';
import '../data/vos/overview_vo/detail_vo.dart';
import '../widgets/carousel_slider_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: HomeTab.values.length,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Selector<HomePageBloc, List<DetailVO>?>(
                builder: (_, bookData, __) {
                    HomePageBloc bloc = context.read<HomePageBloc>();
                  return Visibility(
                    visible: (bookData?.isEmpty ?? true)?bloc.isVisible = false:true,
                    child: CarouselSliderWidget(
                      detailVO: bookData,
                    ),
                  );
                },
                selector: (_, bloc) => bloc.detailVO,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kSP8X),
              child: TabBar(
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: HomeTab.values.map((e) => e.tabTitle).toList(),
              ),
            ),
            Selector<HomePageBloc, ResultsVO?>(
                selector: (_, bloc) => bloc.resultsVO,
                builder: (_, bookData, __) {
                  int screenSize =bookData?.lists?.length ?? 1;
                  return  SizedBox(
                    height: MediaQuery.of(context).size.height*(0.37 * screenSize),
                    child: TabBarView(
                      children: [
                        EBookPage(listVO: bookData?.lists),
                        EBookPage(listVO: bookData?.lists),
                      ],
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
