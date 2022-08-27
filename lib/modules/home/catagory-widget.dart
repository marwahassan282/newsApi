import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/models/catagory-model.dart';

class CatagoryWidget extends StatelessWidget {
  Catagory catagory;
  int index;
  CatagoryWidget(this.catagory,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(int.parse(catagory.colorCode)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          bottomLeft: Radius.circular(index%2!=0?0:12),
          bottomRight: Radius.circular(index%2==0?0:12)
        )

      ),
      child: Column(
        children: [
          Image.asset(catagory.image,height: 120,fit: BoxFit.fill,),
          Expanded(child: Center(
            child: Text(catagory.title,style: Theme.of(context).textTheme.headline1?.copyWith(
              color: Colors.white,
              fontSize: 25
            ),),
          ))
        ],
      ),
    );
  }
}
