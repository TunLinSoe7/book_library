import 'package:flutter/material.dart';
import 'package:library_book/bloc/home_page_bloc.dart';
import 'package:library_book/bloc/library_page_bloc.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/constant/strings.dart';
import 'package:library_book/data/vos/overview_vo/detail_vo.dart';
import 'package:library_book/widgets/book_widget.dart';
import 'package:provider/provider.dart';

class YourBookPage extends StatelessWidget {
  const YourBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: kSP10X,right: kSP10X),
     child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
       children: [
        Container(
          margin: const EdgeInsets.only(left: kSP15X,top: kSP10X),
          padding: const EdgeInsets.all(kSP10X),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kSP10X),
            border: Border.all(width: 2,color: Colors.grey.withOpacity(0.5))
          ),
          child: const Text("Combined Print and E-book Fiction"),
        ),
         const SizedBox(height: kSP25X,),
         Container(
           margin: const EdgeInsets.only(left: kSP15X,right: kSP15X),
           child: const Row(
             children: [
               Icon(Icons.sort),
               SizedBox(width: kSP5X,),
               Text(kSortByRecent,style: TextStyle(fontWeight: FontWeight.bold),),
               Spacer(),
               Icon(Icons.apps)
             ],
           ),
         ),
         Expanded(
           child: Selector<LibraryPageBloc,List<DetailVO>?>(builder: (_,bookData,__){
             return GridView.builder(
                 itemCount:bookData?.length ,
                 gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.8,
                     crossAxisCount: 2), itemBuilder: (_,index){
                   return BookAndTitleWidget(
                     imageUrl: "${bookData?[index].bookImage}",
                     title: "${bookData?[index].title}",
                     imageHeight: kSP170X, imageWidth: kSP170X, icon:PopupMenuButton(
                     color: Colors.cyan,
                       itemBuilder: (context)=>[
                        PopupMenuItem(
                         onTap:(){
                           _showSnackBar(context,bookData?[index]);
                           context.read<HomePageBloc>().deleteYourBook("${bookData?[index].title}");
                          },
                           child: const Text("Delete",style: TextStyle(color: Colors.white,fontSize: kSP15X),)),
                   ]),);
             });
           }, selector: (_,bloc)=>bloc.getDetailData),
         ),
       ],
     ),
    );
  }
  void _showSnackBar(context,DetailVO? booksVO){
    final snackBar = SnackBar(content:Text("Delete ${booksVO?.title} From Library") );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
