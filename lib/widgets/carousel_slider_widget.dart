import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:library_book/constant/strings.dart';
import 'package:library_book/data/vos/overview_vo/detail_vo.dart';
class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key, this.detailVO});
  final List<DetailVO>? detailVO;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount:detailVO?.length , itemBuilder:(_,index,index1){
      return Container(
        margin: const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width*0.5,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
                child:CachedNetworkImage(imageUrl: "${detailVO?[index].bookImage}",width: MediaQuery.of(context).size.width*0.8,height: 220,fit: BoxFit.fill,
                placeholder: (_,url)=>Image.asset(kPlaceHolderImage),errorWidget: (_,error,__)=>Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS162FBn5-1qpZR3OFqmLddrvqhuKrtl_OR9A&usqp=CAU"),),
            ),
            const SizedBox(height: 5,),
            Expanded(child: Text("${detailVO?[index].title}")),
          ],
        )
      );
    }, options:CarouselOptions(
      height: 280,
      enableInfiniteScroll: false,
      viewportFraction: 1,
      enlargeCenterPage: true,
      autoPlay: true,
    ) ,);
  }
}
