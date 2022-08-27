import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/models/catagory-model.dart';
import 'package:newsapi/modules/home/tabs-controller.dart';

import '../../models/sourseResponse.dart';
import '../../shared/network/remote/Api-manager.dart';

class NewsFragment extends StatelessWidget {
Catagory catagory;
NewsFragment(this.catagory);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<SourseResponse>(
          future: ApiManger.getsources(catagory.id),
          builder: (c,snapShot){
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
            var listSources=snapShot.data?.sources??[];
            print('my item is ${listSources[0]}');
            return TabControolerItem(listSources);
          }




      ),
    ) ;
  }
}
