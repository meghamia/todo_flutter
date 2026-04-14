import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:todo_flutter/apis/model.dart';

// class PostDetailScreen extends StatelessWidget {
//   final MyPostModel posts;
//
//   const PostDetailScreen({super.key,required this.posts});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Post DEtail Screen"),),
//       body: Container(
//         padding: EdgeInsets.all(39),
//         child: Column(
//           children: [
//             Column(
//               children: [
//                 Image.network(posts.thumbnail,height: 90,fit: BoxFit.cover,),
//                 Text(posts.title),
//                 Text("price:\$${posts.price}")
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class PostDetailScreen extends StatelessWidget {
  final MyPostModel posts;
  const PostDetailScreen({super.key,required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("post detail screen"),
      ),
      body: Column(
        children: [
          Image.network(posts.thumbnail,
          height: 20,width: 50,
          ),
          Text(posts.title),
          Text("posts:\$${posts.price}")
        ],
      ),
    );
  }
}
