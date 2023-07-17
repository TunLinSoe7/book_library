import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_book/constant/strings.dart';
import '../data/vos/overview_vo/book_vo.dart';
class BookDetailPage extends StatelessWidget {
  const BookDetailPage({super.key, required this.book,});
final BooksVO? book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 70,
            actions: [
              Icon(Icons.search_rounded),
              SizedBox(width: 20,),
              Icon(Icons.bookmark_add_outlined),
              SizedBox(width: 20,),
              Icon(Icons.more_vert_outlined)
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  SizedBox(
                    child: Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height:200,
                          width: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,imageUrl: "${book?.bookImage}",
                              errorWidget: (_,error,url)=>const Icon(Icons.error),
                              placeholder: (_,url)=>Image.asset(kPlaceHolderImage),),
                          )),
                        Expanded(
                          flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(15),
                              alignment: Alignment.topLeft,
                                child: Text("${book?.title}",style: TextStyle(fontSize: 15),textAlign: TextAlign.justify,))),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
