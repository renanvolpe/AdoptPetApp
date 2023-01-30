import 'package:adopt_pet_app/features/cat/bloc/blocGetCatImage/cat_get_image_dart_bloc.dart';
import 'package:adopt_pet_app/models/cat_model/cat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetImageStudyCat extends StatefulWidget {
  const GetImageStudyCat(
      {Key? key, required this.cat, required this.functionList})
      : super(key: key);
  final Cat cat;
  final Function functionList;
  @override
  State<GetImageStudyCat> createState() => _GetImageStudyCatState();
}

class _GetImageStudyCatState extends State<GetImageStudyCat> {
  @override
  void initState() {
    BlocProvider.of<CatGetImageBloc>(context)
        .add(CatGetImageEvent(widget.cat.reference_image_id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CatGetImageBloc, CatGetImageState>(
      listenWhen: (previous, current) {
        if (widget.cat.urlImage == null) {
          return true;
        }
        return false;
      },
      listener: (context, state) async {
        if (state is CatGetImageSuccessState) {
          setState(() {
            widget.functionList(state.urlImage);
          });
        }
        if (state is CatGetImageFailureState) {
          setState(() {
            widget.cat.urlImage = state.failureImage;
          });
        }
      },
      builder: (context, state) {
        if (widget.cat.urlImage != null) {
          return Image.network(
            widget.cat.urlImage ?? "",
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
              return const Center(
                  child: Text("Sem imagem")); //TODO change to imagem
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
