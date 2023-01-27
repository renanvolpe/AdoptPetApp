import 'package:adopt_pet_app/features/cat/bloc/blocGetCatImage/cat_get_image_dart_bloc.dart';
import 'package:adopt_pet_app/features/cat/bloc/blocGetCats/cat_get_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatListPage extends StatefulWidget {
  const CatListPage({Key? key}) : super(key: key);

  @override
  State<CatListPage> createState() => _CatListPageState();
}

class _CatListPageState extends State<CatListPage> {
  @override
  void initState() {
    //start call dog list here
    BlocProvider.of<CatGetBloc>(context).add(CatGetListEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //se how much images are using at memory
    //debugInvertOversizedImages = true;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de cachorros para adoção"),
      ),
      body: BlocBuilder<CatGetBloc, CatGetState>(
        builder: (context, stateCatGet) {
          if (stateCatGet is CatGetSuccessState) {
            return Container(
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1, color: Colors.black)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 100,
                              height: 80,
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              child: GetImageCat(
                                referenceUrl: stateCatGet
                                    .listCats[index].reference_image_id,
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                stateCatGet.listCats[index].name,
                                style: const TextStyle(color: Colors.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  stateCatGet.listCats[index].temperament,
                                  overflow: TextOverflow.fade,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            );
          } else if (stateCatGet is CatGetProgressState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Text("Houve algum erro de execução");
          }
        },
      ),
    );
  }
}

class GetImageCat extends StatefulWidget {
  const GetImageCat({Key? key, required this.referenceUrl}) : super(key: key);
  final String referenceUrl;
  @override
  State<GetImageCat> createState() => _GetImageCatState();
}

class _GetImageCatState extends State<GetImageCat> {
  @override
  void initState() {
    BlocProvider.of<CatGetImageBloc>(context)
        .add(CatGetImageEvent(widget.referenceUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatGetImageBloc, CatGetImageState>(
        builder: ((context, state) {
      if (state is CatGetImageSuccessState) {
        return Image.network(
          state.urlImage,
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
      }

      return Container();
    }));
  }
}
