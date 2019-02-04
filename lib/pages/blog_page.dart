import 'package:flutter/material.dart';
import 'package:sample_blog/models/post_model.dart';
import 'package:sample_blog/widgets/post_card_widget.dart';

class BlogPage extends StatelessWidget {

  List<Post> _postsList = getPosts();

   static getPosts() {
     List<Post> list = new List<Post>();
     for(int i =0; i < 5; i++) {
       list.add(new Post('Post about alps $i','Sample description about alps post $i', imageUrl: 'https://cdn-images-1.medium.com/max/1600/1*Jie55HRpeCmZpmldgrL2eQ.png',
       isVisited: true));
       list.add(new Post('second type post $i','second type description $i', imageUrl: 'https://wallpaperstudio10.com/static/wpdb/wallpapers/3840x2160/171425.jpg',
       isVisited: false));
     }
     return list;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Blog sample")),
      body: new ListView(
        children: _postsList.map((post) => new PostCardWidget(post)).toList(),
      ),
    );
  }
}