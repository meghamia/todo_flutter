import 'package:flutter/material.dart';
import 'package:todo_flutter/apis/api_service.dart';
import 'package:todo_flutter/apis/model.dart';
import 'package:todo_flutter/apis/product_card.dart';

// class ProductListScreen extends StatelessWidget {
//   const ProductListScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("ProductList Screen"),
//       ),
//       body: FutureBuilder<List<MyPostModel>>(
//           future: ApiService.fetchProducts(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text(snapshot.error.toString()),
//               );
//             }
//             final posts = snapshot.data!;
//             return ListView.builder(itemBuilder: (context, index) {
//               return Card(
//                 margin: EdgeInsets.symmetric(horizontal: 18, vertical: 23),
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: ListTile(
//                   contentPadding: EdgeInsets.all(20),
//                   leading: ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: Image.network(
//                       posts[index].thumbnail,
//                       height: 50,
//                       width: 50,
//                       fit: BoxFit.cover,
//
//                     ),
//                   ),
//                   title: Text(posts[index].title),
//                   subtitle: Text('price: \$${posts[index].price}'),
//                   onTap: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>PostDetailScreen(posts: posts[index])));
//                   },
//                 ),
//               );
//             });
//           }),
//     );
//   }
// }

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product list screen "),
      ),
      body: FutureBuilder<List<MyPostModel>>(
          future: ApiService.fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            final posts = snapshot.data!;
            return ListView.builder(itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  leading: ClipRRect(
                    child: Image.network(
                      posts[index].thumbnail,
                      height: 40,
                      width: 50,
                    ),
                  ),
                  title: Text(posts[index].title),
                  subtitle: Text("price:\$${posts[index].price}"),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PostDetailScreen(posts: posts[index])));
                  },
                ),
              );
            });
          }),
    );
  }
}
