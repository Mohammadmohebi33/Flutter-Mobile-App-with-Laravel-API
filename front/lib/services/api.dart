import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../models/Category.dart';

class ApiService{


  final String baseUrl = 'http://192.168.1.9:8000/api/'; 




 Future<List<Category>> fetchcategory() async {
  
    http.Response response = await http.get(Uri.parse(baseUrl + 'categories'));
    List categories = convert.jsonDecode(response.body);
    return categories.map((categories) => Category.formJson(categories)).toList();

  }



 Future<Category> UpdateCategory(id , name) async{

   String uri = baseUrl + 'categories/' + id.toString(); 
   http.Response response = await http.put(Uri.parse(uri) , 
     headers: {HttpHeaders.contentTypeHeader : 'application/json' , HttpHeaders.acceptHeader : 'application/json',},
     body: convert.jsonEncode({'name' : name}),
   );

   return Category.formJson(convert.jsonDecode(response.body));
 } 
}