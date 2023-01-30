// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adopt_pet_app/features/cat/bloc/blocGetCatImage/cat_get_image_dart_bloc.dart';
import 'package:adopt_pet_app/features/cat/components/cat_image_component.dart';
import 'package:adopt_pet_app/features/cat/components/cat_image_study_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:adopt_pet_app/features/cat/bloc/blocGetCats/cat_get_bloc.dart';

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
                  itemCount: stateCatGet.listCats.length,
                  itemBuilder: (_, index) {
                    return Center(
                      child: Container(
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
                                //put bloc provider here to close after conclude execution
                                child:
                                GetImageCat(referenceImage: stateCatGet.listCats[index].reference_image_id,)
                                //  BlocProvider(
                                //   create: (context) => CatGetImageBloc(),
                                //   child: GetImageStudyCat(
                                //     cat: stateCatGet.listCats[index],
                                //     functionList: (catImageURL) {
                                //       stateCatGet.listCats[index].urlImage =
                                //           catImageURL;
                                //     },
                                //   ),
                                // )
                                ),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
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
