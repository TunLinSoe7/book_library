import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_book/constant/strings.dart';
class YourBookPage extends StatelessWidget {
  const YourBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
           child: Container(
             child: GridView.builder(
               itemCount:5 ,
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), itemBuilder: (_,index){
               return Container(
                 child: Column(
                   children: [
                     CachedNetworkImage(imageUrl: "",errorWidget: (_,error,__)=>Icon(Icons.error),placeholder: (_,holder)=>Image.asset(kPlaceHolderImage),)
                   ],
                 ),
               );
             }),
           ),
         ),
       ],
     ),
    );
  }
}
