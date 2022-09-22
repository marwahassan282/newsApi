import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeDrawer extends StatelessWidget {
Function onMeniCallBack;
HomeDrawer(this.onMeniCallBack);
static const int cat=1;
static const int seeting=2;
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;

    return  Container(
      color: Colors.white,
      width: size.width*0.70,
      child: Column(

          children: [
Container(
  width: double.infinity,
  padding: EdgeInsets.symmetric(vertical: 70),
  color: Theme.of(context).primaryColor,
  child: Center(child: Text( AppLocalizations.of(context)!.newsTitle,style: Theme.of(context).textTheme.headline1?.copyWith(
    fontSize: 32
  ))),
),
            InkWell(
              onTap: (){
                onMeniCallBack(cat);
              },

                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Icon(Icons.list),
                      SizedBox(width: 5,),
                      Text( AppLocalizations.of(context)!.catagory,style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ),
              ),

            InkWell(
              onTap: (){
                onMeniCallBack(seeting);
              },

              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 5,),
                    Text( AppLocalizations.of(context)!.settings,style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
            ),
          ],
        ),
    );

  }
}
