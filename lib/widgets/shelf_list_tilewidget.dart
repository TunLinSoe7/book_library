// import 'package:flutter/material.dart';
// import 'package:library_book/constant/strings.dart';
// import 'package:library_book/data/vos/overview_vo/shelf_vo.dart';
// class ShelfListTileWidget extends StatelessWidget {
//   const ShelfListTileWidget({super.key, required this.shelfVO, required this.onTap, this.onTapOne});
//  final List<ShelfVO> shelfVO;
//  final Function(ShelfVO) onTap;
//  final GestureTapCallback? onTapOne;
//   final imageURL =
//       'https://www.artyzen.com/wp-content/uploads/2021/12/empty.jpg';
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       shrinkWrap: true,
//       children: [
//          Visibility(
//            visible: shelfVO.isEmpty?true:false,
//              child: const Center(
//                child:  SizedBox(
//                  child: Text("There is no shelf right now.Create New Shelf"),
//                ),
//              )
//          ),
//         Visibility(
//           visible: shelfVO.isNotEmpty?true:false,
//             child: ListView(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               children: shelfVO.map((shelfData){
//                   String leading = '';
//                   String bookCount ="";
//                   String title = shelfData.shelfName.toString();
//                   int bookLength = shelfData.detailVO?.length ?? 0;
//                   if(shelfData.detailVO?.isEmpty ?? true){
//                        leading = imageURL;
//                        bookCount = 'Empty Book';
//                   }else{
//                     leading = shelfData.detailVO?.first.bookImage.toString() ?? kDefaultImage;
//                     if(bookLength<=1){
//                        bookCount = "$bookLength book";
//                     }else{
//                       bookCount = "$bookLength books";
//                     }
//                   }
//                 return ListTile(
//                   trailing: InkWell(
//                        onTap:onTapOne ,
//                       child: const Icon(Icons.chevron_right)),
//                   leading: Image.network(leading),
//                   title: Text(title),
//                   subtitle: Text(bookCount),
//                   onTap: onTap(shelfData),
//                 );
//               }).toList(),
//             ),
//         ),
//       ],
//     );
//   }
// }
