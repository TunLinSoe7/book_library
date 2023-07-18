import 'package:flutter/material.dart';
import 'package:library_book/bloc/home_page_bloc.dart';
import 'package:library_book/data/vos/overview_vo/list_vo.dart';
import 'package:library_book/widgets/book_widget.dart';
import 'package:library_book/widgets/list_view_title_widget.dart';
import 'package:provider/provider.dart';

class EBookPage extends StatelessWidget {
  const EBookPage({super.key, required this.listVO});

  final List<ListsVO>? listVO;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child:  ListView.builder(
                shrinkWrap: true,
                itemCount: listVO?.length,
                itemBuilder: (_, index) {
                  return listVO==null
                      ? const Center(child:  CircularProgressIndicator())
                      :SizedBox(
                      height: MediaQuery.of(context).size.height * 0.37,
                      child: ListViewTitleWidget(
                          title: "${listVO?[index].listName}",
                          icon: Icons.arrow_forward_ios,
                          itemBuilder: (_, index1) {
                            return listVO==null
                                ? const CircularProgressIndicator()
                                :BookAndTitleWidget(
                                onTap: () {
                                  HomePageBloc provider = Provider.of<HomePageBloc>(context,listen: false);
                                  provider.saveBookDataInDetail(listVO?[index].books?[index1]);
                                },
                                imageUrl:
                                    "${listVO?[index].books?[index1].bookImage}",
                                title: "${listVO?[index].books?[index1].title}",
                                imageHeight: 170,
                                imageWidth: 170);
                          },
                          itemCount: listVO?[index].books?.length ?? 0));}));
  }
}
