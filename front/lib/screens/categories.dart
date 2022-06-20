import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class Category{

  int id ; 
  String name; 
  Category({required this.id ,required this.name});

  factory Category.formJson(Map<String , dynamic>json){
    return Category(id: json['id'], name: json['name']);
  }


}


 
class Categories extends StatefulWidget {

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
 
 late Future<List<Category>> futureCategory ; 
  
  Future<List<Category>> fetchcategory() async {
    http.Response response = await http.get(Uri.parse('http://192.168.1.9:8000/api/categories'));
    List categories = convert.jsonDecode(response.body);
    return categories.map((categories) => Category.formJson(categories)).toList();
  }
  

  @override
  void initState() {
    super.initState();
    futureCategory = fetchcategory(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('categories'),
      ),
      body: Container(
        color: Theme.of(context).primaryColorDark,
        child: Center(
         child: FutureBuilder<List<Category>>(
          future: futureCategory,
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                 itemCount: snapshot.data!.length,
                 itemBuilder: (context , index){
                  Category c = snapshot.data![index];
                  return ListTile(
                    title: Text(c.name),
                  );
                 },
              );
            }
            return CircularProgressIndicator(); 
          }
         ),
        ),
      ),
    );
  }
}


