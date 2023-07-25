import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_book/constant/strings.dart';
import '../constant/dimens.dart';
import '../data/vos/overview_vo/list_vo.dart';

class BookAndTitleWidget extends StatelessWidget {
  const BookAndTitleWidget({super.key, this.listVO, required this.imageUrl, required this.title, required this.imageHeight, required this.imageWidth, this.onTap, this.onTap1, required this.icon});
  final List<ListsVO>? listVO;
  final String imageUrl;
  final String title;
  final double imageHeight;
  final double imageWidth;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onTap1;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: kSP170X,
        margin: const EdgeInsets.all(kSP10X),
        child: Column(
          children: [
            SizedBox(
              width: imageWidth,
              height: imageHeight,
              child: GestureDetector(
                onTap: onTap,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(kSP10X),
                      child: CachedNetworkImage(
                            width: imageWidth,
                            height: imageHeight,
                            fit: BoxFit.fill,
                            imageUrl: imageUrl.isEmpty?kDefaultImage:imageUrl
                          ,placeholder: (_,holder)=>Image.asset(kPlaceHolderImage,fit: BoxFit.fill,),
                          errorWidget: (_,error,__)=> Image.network(kDefaultImage),),
                    ),
                      Positioned(
                      top: 3,
                        left: kSP135X,
                        child: GestureDetector(
                          onTap: onTap1,
                            child: icon)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: kSP5X,),
            Expanded(
                child: Text(title,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
          ],
        ));
  }
}
