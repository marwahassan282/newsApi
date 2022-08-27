import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/modules/home/news-item.dart';
import 'package:newsapi/modules/home/searchpage.dart';
import 'package:newsapi/shared/network/remote/Api-manager.dart';

import '../../models/newsResponse.dart';
import '../../models/sourseResponse.dart';


class newsScreen extends StatelessWidget {
  Sources newsSource;

newsScreen(this.newsSource);
  @override
  Widget build(BuildContext context) {
    var controller=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title:
            Text('sports'),
        actions: [
         InkWell(
           onTap: (){
             Container(
               width: double.infinity,
               height: 40,
               decoration: BoxDecoration(
                   color: Colors.white, borderRadius: BorderRadius.circular(5)),
               child: Center(
                 child: TextField(
                   controller: controller,
                   decoration: InputDecoration(
                       prefixIcon: const Icon(Icons.search),
                       suffixIcon: IconButton(
                         icon: const Icon(Icons.clear),
                         onPressed: () {
                           /* Clear the search field */
                         },
                       ),
                       hintText: 'Search...',
                       border: InputBorder.none),
                 ),
               ),
             );
           },
           child: Icon(Icons.search,
              ),
         ),

        ],




      ),
      body:  FutureBuilder<NewsResponse>(
          future: ApiManger.getnews(newsSource,),
          builder:(c,snapShot){
            if(snapShot.connectionState==ConnectionState.waiting){
              return Center(
                  child: CircularProgressIndicator()
              );}
            if(snapShot.hasError){
              return Column(
                children: [
                  Text('something went error'),
                  ElevatedButton(onPressed:(){}, child:Text('try Again')),
                ],
              );

            }

            if('0k'!=snapShot.data?.status){
              Column(
                children: [
                  Text('something went error'),
                  ElevatedButton(onPressed:(){}, child:Text('try Again')),
                ],
              );
            }
            var newslist=snapShot.data?.articles??[];
            return ListView.builder(itemCount: newslist.length,
                itemBuilder: (context,index){
                  return  NewsItem(newslist[index]);

                });

          })

    );
  }
}
