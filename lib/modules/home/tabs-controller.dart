import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/modules/home/news.dart';
import 'package:newsapi/modules/home/tab-item.dart';


import '../../models/sourseResponse.dart';

class TabControolerItem extends StatefulWidget {
 List< Sources> sources;

 TabControolerItem(this.sources);

  @override
  State<TabControolerItem> createState() => _TabControolerItemState();
}

class _TabControolerItemState extends State<TabControolerItem> {
 int isSelectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length, child: TabBar(
          onTap: (index){
            isSelectedIndex=index;
            setState(() {

            });
          },
          isScrollable: true,
          indicatorColor: Colors.transparent,
          tabs: widget.sources.map((oneSourse) =>TabItem(oneSourse, widget.sources.indexOf(oneSourse)==isSelectedIndex)).toList(),

        )),
        Expanded(child: newsScreen(widget.sources[isSelectedIndex])),

      ],
    );
    
  }
}
