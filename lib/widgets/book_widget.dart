import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_book/constant/strings.dart';

import '../data/vos/overview_vo/list_vo.dart';
class BookAndTitleWidget extends StatelessWidget {
  const BookAndTitleWidget({super.key, this.listVO, required this.imageUrl, required this.title, required this.imageHeight, required this.imageWidth, this.onTap});
  final List<ListsVO>? listVO;
  final String defaultImage = "https://media.istockphoto.com/id/1350722846/photo/…20&c=3_QqKjo9OVEdt-6BA1fGKjJEY07qfAOG46Bozwegcdg=";
  final String imageUrl;
  final String title;
  final double imageHeight;
  final double imageWidth;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 170,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              width: imageWidth,
              height: imageHeight,
              child: GestureDetector(
                onTap: onTap,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: imageUrl.isEmpty?defaultImage:imageUrl
                  ,placeholder: (_,holder)=>Image.asset(kPlaceHolderImage,fit: BoxFit.fill,),
                  errorWidget: (_,error,__)=> const CircularProgressIndicator(),),
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Expanded(
                child: Text(title,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
          ],
        ));
  }
}
