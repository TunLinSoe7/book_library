import 'package:flutter/material.dart';
import 'package:library_book/constant/strings.dart';
import '../constant/dimens.dart';
import '../data/vos/overview_vo/book_vo.dart';
class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key, required this.image, required this.title, this.onTap, this.onTapLib, this.booksVO, });
  final String image;
  final String title;
  final BooksVO? booksVO;
  final GestureTapCallback? onTap;
  final void Function()? onTapLib;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(kSP10X),
              topRight: Radius.circular(kSP10X)
          )
      ),
      height: kSP300X,
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                  borderRadius:BorderRadius.circular(kSP15X),
                  child: Image.network(image,width: kSP60X,height: kSP80X,fit: BoxFit.fill,)),
              Container(
                margin: const EdgeInsets.only(left: kSP10X),
                child: Column(
                  children: [
                    Text(title,style: const TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(width: kSP5X,),
                    const Text("E Book"),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height:kSP5X),
          const Divider(color: Colors.grey,),
          const SizedBox(height:kSP5X),
          const ListTile(leading: Icon(Icons.remove_circle),title: Text(kRemoveDownload),),
          ListTile(leading:const Icon(Icons.delete),title: const Text(kDeleteFromLibrary),
          onTap:onTapLib
          ),
          ListTile(leading: const Icon(Icons.add_circle_rounded),title: const Text(kAddToShelf),
          onTap: onTap,),
        ],
      ),
    );
  }
}
