import 'package:flutter/material.dart';
import 'package:my_app/model/comment_model.dart';
import 'package:my_app/repositories/comments/comment_repository.dart';
import 'package:my_app/repositories/comments/impl/comment_dio_repository.dart';
import 'package:my_app/repositories/comments/impl/comment_http_repository.dart';

class CommentPage extends StatefulWidget {
  final int postId;
  const CommentPage({super.key, required this.postId});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  var commentModel = <CommentModel>[];
  late CommentRepository commentRepository;

  @override
  void initState() {
    super.initState();
    commentRepository = CommentDioRepository();
    carregarDados();
  }

  carregarDados() async {
    commentModel = await commentRepository.retornaComentarios(widget.postId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Comentario do Post: ${widget.postId}"),
      ),
      body: ListView.builder(
          itemCount: commentModel.length,
          itemBuilder: (_, int index) {
            var postComments = commentModel[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(postComments.body)],
              ),
            );
            ;
          }),
    ));
  }
}
