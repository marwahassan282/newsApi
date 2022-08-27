import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/models/catagory-model.dart';
import 'package:newsapi/modules/home/catagory-widget.dart';

class CatagoriesFragment extends StatelessWidget {
 var catagory=Catagory.getCatagory();
 Function onclickedcatagory;
 CatagoriesFragment(this.onclickedcatagory);

 @override
  Widget build(BuildContext context) {
    return Container(
      child:
          GridView.builder(
              itemCount:catagory.length,
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8), itemBuilder: (context,index){
            return InkWell(
              onTap: (){
onclickedcatagory(catagory[index]);
              },
                child: CatagoryWidget(catagory[index],index));
          })

    );
  }
}
