import 'package:flutter/material.dart';
import 'package:library_book/constant/strings.dart';
import 'package:library_book/data/vos/overview_vo/shelf_vo.dart';
class ShelfListTileWidget extends StatelessWidget {
  const ShelfListTileWidget({super.key, required this.shelfVO, required this.onTap});
 final List<ShelfVO> shelfVO;
 final Function(ShelfVO) onTap;
  final imageURL =
      'https://www.artyzen.com/wp-content/uploads/2021/12/empty.jpg';
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
         Visibility(
           visible: shelfVO.isEmpty?true:false,
             child: const SizedBox(
               child: Center(
                 child: Text("There is no shelf right now.Create New Shelf"),
               ),
             )
         ),
        Visibility(
          visible: shelfVO.isNotEmpty?true:false,
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: shelfVO.map((data){
                  String leading = '';
                  String bookCount ="";
                  String title = data.shelfName.toString();
                  int bookLength = data.detailVO?.length ?? 0;
                  if(data.detailVO?.isEmpty ?? true){
                       leading = imageURL;
                       bookCount = 'Empty Book';
                  }else{
                    leading = data.detailVO?.first.bookImage.toString() ?? kDefaultImage;
                    if(bookLength<=1){
                       bookCount = "$bookLength book";
                    }else{
                      bookCount = "$bookLength books";
                    }
                  }
                return ListTile(

                  leading: Image.network(leading),
                  title: Text(title),
                  subtitle: Text(bookCount),
                  onTap: onTap(data),
                );
              }).toList(),
            ),
        ),
      ],
    );
  }
}
