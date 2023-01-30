import 'package:adopt_pet_app/features/cat/bloc/blocGetCatImage/cat_get_image_dart_bloc.dart';
import 'package:adopt_pet_app/models/cat_model/cat.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetImageCat extends StatefulWidget {
  const GetImageCat({Key? key, required this.referenceImage,})
      : super(key: key);
  final String referenceImage;
  @override
  State<GetImageCat> createState() => _GetImageCatState();
}

class _GetImageCatState extends State<GetImageCat> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://cdn2.thecatapi.com/images/${widget.referenceImage}.jpg",
      fit: BoxFit.cover,
      cacheWidth: 100,
      cacheHeight: 80,
      loadingBuilder: (context, child, loadingProgress) {
        loadingProgress;
        if (loadingProgress != null) {
          return const Center(child: CircularProgressIndicator());
        }
        return child;
      },
      errorBuilder: (context, error, stackTrace) {
        return const Center(child: Text("Sem imagem")); //TODO change to imagem
      },
    );
  }
}
