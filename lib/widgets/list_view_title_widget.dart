import 'package:flutter/material.dart';
class ListViewTitleWidget extends StatelessWidget {
  const ListViewTitleWidget({super.key, required this.itemBuilder, required this.itemCount, required this.title, required this.icon});
final IndexedWidgetBuilder itemBuilder;
final int itemCount;
final String title;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return
        Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                child: Row(
                  children: [
                    Text(title,style: const TextStyle(fontWeight: FontWeight.bold),),
                   const  Spacer(),
                    Icon(icon)
                  ],
                ),
              ),
            )),
            Expanded(
              flex: 5,
              child: SizedBox(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: itemBuilder, separatorBuilder: (_,index)=>const SizedBox(width: 5,), itemCount: itemCount),
              ),
            ),
          ],
        );

  }
}
