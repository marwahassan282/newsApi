import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../models/sourseResponse.dart';

class TabItem extends StatelessWidget {
Sources sources;
bool isSelected;
TabItem(this.sources,this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
  color: isSelected  ?Colors.green:Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green)
      ),
      child:
          Text('${sources.name}',style: TextStyle(
            color:isSelected  ?Colors.white:Colors.green,
          ),),

    );
  }
}
