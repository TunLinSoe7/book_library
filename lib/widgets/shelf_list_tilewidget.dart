import 'package:flutter/material.dart';

import '../data/vos/overview_vo/shelf_hive_vo.dart';


class ShelveListWidget extends StatelessWidget {
  const ShelveListWidget({Key? key,required this.shelves,required this.onTap}) : super(key: key);
  final List<ShelfHiveVO>? shelves;
  final imageURL =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiQc9dZn33Wnk-j0sXZ19f8NiMZpJys7nTlA&usqp=CAU';
  final emptyImageURL =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiQc9dZn33Wnk-j0sXZ19f8NiMZpJys7nTlA&usqp=CAU';
  final Function(ShelfHiveVO)onTap;
  @override
  Widget build(BuildContext context) {
    return   ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Visibility(
            visible: shelves?.isEmpty ?? true,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: const Center(
                child: Text("Create Shelf Now"),
              )
            ),
          ),
          Visibility(
              visible: shelves?.isNotEmpty ?? true,
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: shelves?.map((value) {
                  String leadingImage = '';
                  String bookCount = '';
                  String title = value.shelfName.toString();
                  if(value.shelfVO?.isEmpty??true){
                    leadingImage=imageURL;
                  }else{
                    leadingImage=value.shelfVO?.first.image.toString()??emptyImageURL;
                  }
                  if (value.shelfVO?.isEmpty??true) {
                    bookCount = 'Empty';
                  } else {
                    int length = value.shelfVO?.length ?? 0;
                    if (length <= 1) {
                      bookCount = '$length book';
                    } else {
                      bookCount = '$length books';
                    }
                  }
                  return ListTile(
                    onTap: () {
                      onTap(value);
                    },
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        leadingImage,
                        width:50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(title),
                    subtitle: Text(bookCount),
                    trailing: const Icon(Icons.chevron_right,color: Colors.black,),
                  );
                }).toList() ?? [],
              ))
        ]);
  }
}
