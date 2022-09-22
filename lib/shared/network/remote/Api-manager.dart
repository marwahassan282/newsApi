import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:newsapi/models/newsResponse.dart';

import 'package:newsapi/shared/components/constant.dart';


import '../../../models/sourseResponse.dart';
class ApiManger{


 static Future<SourseResponse> getsources(String catagoryid) async{
  //calling api
  var uri=Uri.https(BaseUrl, 'v2/top-headlines/sources',{
    'apiKey':ApiKey,'category':catagoryid,
  });
 var response=await  http.get(uri); // get data from Api
 try{ //convert data from api(joison) to model
   var bodystring=response.body;
   var joson=jsonDecode(bodystring);
   var sourceResponse=SourseResponse.fromJson(joson);
   return sourceResponse;
 }
 catch(e){ //if there an error through converting data to model
   throw e;
 }
}
 static Future <NewsResponse> getnews(Sources source,String search) async{
  var uri=Uri.https(BaseUrl, '/v2/everything',{
    'apiKey':ApiKey,'sources':source.id,'q':search
  });
  var response=await  http.get(uri);

  try{ //convert data from api(joison) to model
    var bodystring=response.body;
    var joson=jsonDecode(bodystring);
    var newResponse=NewsResponse.fromJson(joson);
    return newResponse;
  }
  catch(e){ //if there an error through converting data to model
    throw e;
  }
}


}