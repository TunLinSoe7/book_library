import 'package:cached_network_image/cached_network_image.dart';
import 'package:library_book/bloc/search_page_bloc.dart';
import 'package:library_book/constant/strings.dart';
import 'package:library_book/data/vos/search_vo/item_vo.dart';
import 'package:library_book/view_items/search_items_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
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
                Provider.of<SearchPageBloc>(context,listen: false).searchResult(string.toLowerCase());
              }
            },
            decoration: const InputDecoration(
              hintText: "Search Books",
              border: InputBorder.none,
            ),
          ),
          actions: const [
            Icon(Icons.mic),
            SizedBox(width: 10,),
          ],
        ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SearchRecentView(icon: Icon(Icons.new_releases),
              text: Text("New Release"),
              onTap: (){},

            ),
            Selector<SearchPageBloc,List<ItemsVO>?>(selector: (_ ,bloc )=>bloc.itemSearch,
            builder: (_, value,child) {
              return Selector<SearchPageBloc,bool>(builder:(_,condition,__){
                return Visibility(
                  visible:controller.text.isEmpty?condition = false:condition=true ,
                  child: ListView.builder(itemCount: value?.length ,itemBuilder: (_,index){
                    return value==null?const CircularProgressIndicator():ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child:CachedNetworkImage(fit: BoxFit.fill,height: 50,width: 50,imageUrl: "${value?[index].volumeInfo?.imageLinks?.thumbnail}",placeholder: (_,url)=>const Icon(Icons.image),
                          errorWidget: (_,url,error)=> Image.asset(kPlaceHolderImage),) ,),
                      title: Text("${value[index].volumeInfo?.title?.toLowerCase()}"),
                      subtitle: Text(value[index].saleInfo?.isEbook ?? false ? "E Book":"Audio Book"),
                    );
                  }),
                );
              }, selector: (_,bloc)=>bloc.getVisible);
            },),
          ],
        ),
      ),
    );
  }
}
