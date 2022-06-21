
import 'dart:io';

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
 final _formKey = GlobalKey<FormState>();
 late Category selectedCategory ;
 final categorynameControlelr = TextEditingController(); 
  
  Future<List<Category>> fetchcategory() async {
    http.Response response = await http.get(Uri.parse('http://192.168.1.9:8000/api/categories'));
    List categories = convert.jsonDecode(response.body);
    return categories.map((categories) => Category.formJson(categories)).toList();
  }

  Future SaveCategory() async {
    final form = _formKey.currentState;
    if(!form!.validate()){
      return; 
    }
    String url = 'http://192.168.1.9:8000/api/categories/'+selectedCategory.id.toString();
    print(url);
    await http.put(Uri.parse(url),

    headers: {
      HttpHeaders.contentTypeHeader : 'application/json' , 
      HttpHeaders.acceptHeader : 'application/json',
    },

    body: convert.jsonEncode({'name' : categorynameControlelr.text}),
    );

  
  setState(() {
     Navigator.pop(context); 
     Navigator.pushNamed(context, '/Categories');
  });
  
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
        title:const Text('categories'),
      ),
      body: Container(
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
                    trailing: IconButton(
                      icon:const Icon(Icons.edit),
                      onPressed: (){
                        selectedCategory = c ; 
                        categorynameControlelr.text = c.name;
                        showModalBottomSheet(
                          context: context,
                           builder: (context){
                              return Padding(
                                padding:const EdgeInsets.all(16),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        controller: categorynameControlelr,
                                        validator: (String? value){
                                          if(value!.isEmpty){
                                            return 'Enter category name'; 
                                          }
                                          return null;                                          

                                        } ,
                                        decoration:const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'category name'
                                        ),
                                      ),
                                      ElevatedButton(
                                         onPressed: () => SaveCategory(),
                                         child:const Text('save'))
                                    ],
                                  ),
                                ),
                              );
                           });
                      },
                    ),
                  );
                 },
              );
            }
            return const CircularProgressIndicator(); 
          }
         ),
        ),
      ),
    );
  }
}


