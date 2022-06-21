class Category{

  int id ; 
  String name; 
  Category({required this.id ,required this.name});

  factory Category.formJson(Map<String , dynamic>json){
    return Category(id: json['id'], name: json['name']);
  }
}
