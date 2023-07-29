import 'package:cached_network_image/cached_network_image.dart';
import 'package:library_book/bloc/home_page_bloc.dart';
import 'package:library_book/bloc/search_page_bloc.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/constant/strings.dart';
import 'package:library_book/data/vos/search_vo/item_vo.dart';
import 'package:library_book/widgets/search_recent_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
class SearchPage extends StatelessWidget {
   SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Selector<SearchPageBloc,TextEditingController>(
      selector: (_,bloc)=>bloc.getController,
      builder: (_,controller,__){
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.arrow_back_ios_new_outlined)),
            title: TextField(
              controller: controller,
              onChanged: (string){
                if(controller.text.isNotEmpty){
                  Provider.of<SearchPageBloc>(context,listen: false).searchResult(string);
                }
              },
              decoration: const InputDecoration(
                hintText: "Search Books",
                border: InputBorder.none,
              ),
            ),
            actions: const [
              Icon(Icons.mic),
              SizedBox(width: kSP10X,),
            ],
          ),
          body: Selector<SearchPageBloc,bool>(
            selector: (_,bloc)=>bloc.getRecentVisible,
            builder: (_,condition,__){
              return Container(
                padding: const EdgeInsets.all(kSP10X),
                child:  Column(
                  children: [
                     // Visibility(
                     //    visible:controller.text.isNotEmpty?condition=false:condition=true,
                     //    child:  SearchRecentWidget()),
                    Selector<SearchPageBloc,bool>(
                      selector: (_,bloc)=>bloc.getVisible,
                      builder: (_,visible,__){
                        return Selector<SearchPageBloc,List<ItemsVO>?>(
                          selector: (_ ,bloc )=>bloc.itemSearch,
                          builder: (_, value,__) {
                            return Visibility(
                              visible:controller.text==""?visible=false:visible=true,
                              child: Expanded(
                                child: ListView.builder(itemCount: value?.length ,itemBuilder: (_,index){
                                  return value==null?const CircularProgressIndicator():ListTile(
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(kSP25X),
                                      child:CachedNetworkImage(fit: BoxFit.fill,height: kSP50X,width: kSP50X,imageUrl: "${value[index].volumeInfo?.imageLinks?.thumbnail}",placeholder: (_,url)=>const Icon(Icons.image),
                                        errorWidget: (_,url,error)=> Image.asset(kPlaceHolderImage),) ,),
                                    title: Text("${value[index].volumeInfo?.title?.toLowerCase()}"),
                                    subtitle: Text(value[index].saleInfo?.isEbook ?? false ? "E Book":"Audio Book"),
                                  );
                                }),
                              ),
                            );
                          },);
                      },
                    ),
                  ],
                ),
              );
            }
          ),
        );
      },

    );
  }
}
