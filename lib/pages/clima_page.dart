import 'package:flutter/material.dart';
import 'package:my_app/model/photos_model.dart';
import 'package:my_app/repositories/photos/photos_dio_repository.dart';

class ClimaPage extends StatefulWidget {
  const ClimaPage({super.key});

  @override
  State<ClimaPage> createState() => _ClimaPageState();
}

class _ClimaPageState extends State<ClimaPage> {
  late PhotosDioRepository _climaDioRepository;
  var photos = <PhotosModel>[];

  @override
  void initState() {
    super.initState();
    carregaDados();
  }

  carregaDados() async {
    photos = await PhotosDioRepository().obterPhotos();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView.builder(
          itemCount: photos.length,
          itemBuilder: (_, int index) {
            var photo = photos[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Card(
                elevation: 9,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(photo.title),
                    ],
                  ),
                ),
              ),
            );
            ;
          }),
    ));
  }
}
