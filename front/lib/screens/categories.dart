import 'dart:io';

import 'package:flutter/material.dart';
import 'package:front/services/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../models/Category.dart';

 
class Categories extends StatefulWidget {

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
 
 late Future<List<Category>> futureCategory ; 
 final _formKey = GlobalKey<FormState>();
 late Category selectedCategory ;
 final categorynameControlelr = TextEditingController(); 
 ApiService apiService = ApiService();
  


  Future SaveCategory() async {
    final form = _formKey.currentState;
    if(!form!.validate()){
      return; 
    }
    apiService.UpdateCategory(selectedCategory.id.toString() , categorynameControlelr.text);
    Navigator.pop(context); 
  }
  
  @override
  void initState() {
    super.initState();
    futureCategory = apiService.fetchcategory(); 
    
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                            isScrollControlled: true,
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
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                               ElevatedButton(
                                           onPressed: () => SaveCategory(),
                                           child:const Text('Save')),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.red
                                                ),
                                           onPressed: () => Navigator.pop(context),
                                           child:const Text('Cancel'))

                                          ],
                                        )
                                     
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
      ),
    );
  }
}


