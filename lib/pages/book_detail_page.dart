import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_book/bloc/book_detail_page_bloc.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:provider/provider.dart';
import '../data/vos/overview_vo/detail_vo.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Selector<BookDetailPageBloc, DetailVO?>(
            selector: (_, bloc) => bloc.detailVO,
            builder: (_, bookData, __) {
              return NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  const SliverAppBar(
                    expandedHeight: 60,
                    actions: [
                      Icon(Icons.search_rounded),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.bookmark_add_outlined),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.more_vert_outlined),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ],
                body: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(kSP10X),
                            child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                height: kSP150X,
                                width: kSP135X,
                                imageUrl: "${bookData?.bookImage}"),
                          ),
                          const SizedBox(
                            width: kSP10X,
                          ),
                          Expanded(
                              child: Text(
                            "${bookData?.title}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         const Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text("4.4 ★",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.bold),),
                             Text("24 reviews",style: TextStyle(color: Colors.black45),)
                           ],
                         ),
                          Container(width: 1, height: 30, color: Colors.grey),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.book,color: Colors.black54,),
                              Text("Ebook",style: TextStyle(color: Colors.black45))
                            ],
                          ),
                          Container(width: 1, height: 30, color: Colors.grey),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("384",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 16)),
                              Text("Pages",style: TextStyle(color: Colors.black45))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}