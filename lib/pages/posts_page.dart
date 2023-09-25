import 'package:flutter/material.dart';
import 'package:my_app/model/posts_model.dart';
import 'package:my_app/pages/comment_page.dart';
import 'package:my_app/repositories/posts/impl/posts_dio_repository.dart';
import 'package:my_app/repositories/posts/impl/posts_http_repository.dart';
import 'package:my_app/repositories/posts/posts_repository.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  var posts = <PostsModel>[];
  late PostsRepository postsRepository;

  @override
  void initState() {
    super.initState();
    postsRepository = PostsDioRepository();
    carregarDados();
  }

  carregarDados() async {
    posts = await postsRepository.listarPosts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: posts.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (_, index) {
                var indexPosts = posts[index];
                print(posts);
                return InkWell(
                  onTap: () {
                    print(indexPosts.id);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                CommentPage(postId: indexPosts.id)));
                  },
                  child: Card(
                      elevation: 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            indexPosts.title,
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            indexPosts.body,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w200),
                          )
                        ],
                      )),
                );
              }),
    ));
  }
}
