// class MyPostModel{
//   int? id;
//   String title;
//   String? description;
//   String thumbnail;
//   double? price;
//
//   MyPostModel({required this.id, required this.title, required this.description, required this.thumbnail, required this.price});
//
//   factory MyPostModel.fromJson(Map<String,dynamic> json){
//     return MyPostModel(
//         id: json['id'],
//         title: json['title'],
//         description: json['description'],
//         thumbnail: json['thumbnail'],
//         price: json['price'],
//     );
//   }
//
// }
class MyPostModel{
  int? id;
  String title;
  String? description;
  String thumbnail;
  double? price;

  MyPostModel({required this.id, required this.title, required this.description,required this.thumbnail, required this.price});

  factory MyPostModel.fromJson (Map<String , dynamic> json){
    return MyPostModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        thumbnail: json['thumbnail'],
        price: json ['price']
    );
  }

}