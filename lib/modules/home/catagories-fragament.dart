import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/models/catagory-model.dart';
import 'package:newsapi/modules/home/catagory-widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CatagoriesFragment extends StatelessWidget {
 var catagory=Catagory.getCatagory();
 Function onclickedcatagory;
 CatagoriesFragment(this.onclickedcatagory);

 @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(

      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.interes,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,
          color: Colors.black),textAlign: TextAlign.start,),
          Expanded(
            child: Container(
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

            ),
          ),
        ],
      ),
    );
  }
}
