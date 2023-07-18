import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_book/bloc/library_page_bloc.dart';
import 'package:library_book/constant/strings.dart';
import 'package:library_book/data/vos/overview_vo/detail_vo.dart';
import 'package:provider/provider.dart';
class YourBookPage extends StatelessWidget {
  const YourBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10,right: 10),
     child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
       children: [
        Container(
          margin: const EdgeInsets.only(left: 15,top: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2,color: Colors.grey.withOpacity(0.5))
          ),
          child: const Text("Combined Print and E-book Fiction"),
        ),
         const SizedBox(height: 20,),
         Container(
           margin: const EdgeInsets.only(left: 15,right: 15),
           child: const Row(
             children: [
               Icon(Icons.sort),
               SizedBox(width: 5,),
               Text("Sort by Recent",style: TextStyle(fontWeight: FontWeight.bold),),
               Spacer(),
               Icon(Icons.apps)
             ],
           ),
         ),
         Expanded(
           child: SizedBox(
             child: Selector<LibraryPageBloc,List<DetailVO>?>(builder: (_,bookData,__){
               return GridView.builder(
                   itemCount:bookData?.length ,
                   gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.8,
                       crossAxisCount: 2), itemBuilder: (_,index){
                 return Column(
                   children: [
                     Container(
                       margin:const EdgeInsets.all(5),
                         child: ClipRRect(
                           borderRadius:BorderRadius.circular(10),
                             child: CachedNetworkImage(
                               width: 150,
                               height: 150,
                               fit: BoxFit.fill,
                               imageUrl: "${bookData?[index].bookImage}",errorWidget: (_,error,__)=>const Center(child: Icon(Icons.image),),placeholder: (_,holder)=>Image.asset(kPlaceHolderImage),))),
                     const SizedBox(height: 5,),
                     Text("${bookData?[index].title}",style: const TextStyle(fontWeight: FontWeight.bold),),
                   ],

                 );
               });
             }, selector: (_,bloc)=>bloc.getDetailData),
           ),
         ),
       ],
     ),
    );
  }
}
