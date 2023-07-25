import 'package:flutter/material.dart';
import 'package:library_book/bloc/book_detail_page_bloc.dart';
import 'package:library_book/bloc/home_page_bloc.dart';
import 'package:library_book/bloc/shelf_page_bloc.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/data/model/library_model_impl.dart';
import 'package:library_book/data/vos/overview_vo/book_vo.dart';
import 'package:library_book/data/vos/overview_vo/list_vo.dart';
import 'package:library_book/pages/book_detail_page.dart';
import 'package:library_book/pages/add_to_shelf_page.dart';
import 'package:library_book/widgets/book_widget.dart';
import 'package:library_book/widgets/list_view_title_widget.dart';
import 'package:provider/provider.dart';
import '../data/model/library_model.dart';
import '../widgets/bottom_sheet_widget.dart';
import 'library_page.dart';


class EBookPage extends StatelessWidget {
  const EBookPage({super.key, required this.listVO});

  final List<ListsVO>? listVO;

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    LibraryModel libraryModel = LibraryModelImpl();
    return SizedBox(
        child:   listVO==null
            ? const Center(child:  CircularProgressIndicator())
            :ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap:false ,
            itemCount: listVO?.length,
            itemBuilder: (_, index) {
              return
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.37,
                    child: ListViewTitleWidget(
                        title: "${listVO?[index].listName}",
                        icon: Icons.arrow_forward_ios,
                        itemBuilder: (_, index1) {
                          return BookAndTitleWidget(
                              icon: const Icon(Icons.bookmark_border_rounded,size: kSP30X,color: Colors.yellow,),
                              onTap1: (){
                                _showBottomSheet(context, listVO?[index].books?[index1] ?? BooksVO(),libraryModel,_controller);
                              },
                              onTap: () {
                                context.read<HomePageBloc>().saveBookDataInDetail(listVO?[index].books?[index1]);
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                                    ChangeNotifierProvider<BookDetailPageBloc>(create: (_)=>
                                        BookDetailPageBloc("${listVO?[index].books?[index1].title}"),
                                      child: const BookDetailPage(),)));
                              },
                              imageUrl:
                              "${listVO?[index].books?[index1].bookImage}",
                              title: "${listVO?[index].books?[index1].title}",
                              imageHeight: kSP170X,
                              imageWidth: kSP170X,);
                        },
                        itemCount: listVO?[index].books?.length ?? 0));}));

  }

  Future _showBottomSheet(BuildContext context,BooksVO booksVO,LibraryModel libraryModel,TextEditingController controller){
    return showModalBottomSheet(context: context , builder:(context){
      return  BottomSheetWidget(image: '${booksVO?.bookImage}',title: '${booksVO?.title}',
        onTap: (){
          Navigator.pop(context);
         ShelfPageBloc bloc = context.read<ShelfPageBloc>();
          bloc.detailVO = context.read<HomePageBloc>().saveBookDataInDetailVOByDetail(booksVO);
          print("data===========>${bloc.detailVO?.title}");
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AddToShelfPage()));
        },onTapLib: (){
          Navigator.pop(context);
        libraryModel.deleteYourBooksByTitle("${booksVO?.title}");
        _showSnackBar(context,booksVO);
        },);
    }
    );
  }
  void _showSnackBar(context,BooksVO? booksVO){
    final snackBar = SnackBar(content:Text("Delete ${booksVO?.title} From Library") );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
