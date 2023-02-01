// ignore_for_file: public_member_api_docs, sort_constructors_first, invalid_use_of_protected_member
import 'package:adopt_pet_app/features/cat/components/cat_image_component.dart';
import 'package:adopt_pet_app/models/cat_model/cat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:adopt_pet_app/features/cat/bloc/blocGetCats/cat_get_bloc.dart';

class CatListPage extends StatefulWidget {
  const CatListPage({Key? key}) : super(key: key);

  @override
  State<CatListPage> createState() => _CatListPageState();
}

class _CatListPageState extends State<CatListPage> {
  //to recieve from formfield
  final _scrollController = ScrollController();

  //to make pagination
  int numberPage = 0;
  String order = "ASC";

  //to show the list of cat
  List<Cat> listCats = [];
  bool isLoaded = false;

  @override
  void initState() {
    //start call dog list here
    //numberPage and ASC is for pagination

    BlocProvider.of<CatGetBloc>(context)
        .add(CatGetListEvent(numberPage, order));
    _scrollController.addListener(_onScroll);
    print("ScrollController was created");
    super.initState();
  }

  @override
  void deactivate() {
    //reinitialize cat state
    BlocProvider.of<CatGetBloc>(context).add(CatResetInicialStateEvent());
    super.deactivate();
  }

  @override
  void dispose() {
    //verify if scroll was disposed
    if (_scrollController.hasClients == true) {
      _scrollController
        ..removeListener(_onScroll)
        ..dispose();
      print("ScrollController was disposed because of return page");
    }

    //evento to get cat initstate
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      setState(() {
        numberPage++;
      });
      context.read<CatGetBloc>().add(CatGetListEvent(numberPage, order));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll);
  }

  @override
  Widget build(BuildContext context) {
    //se how much images are using at memory
    //debugInvertOversizedImages = true;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de gatos para adoção"),
      ),
      body: BlocBuilder<CatGetBloc, CatGetState>(
        builder: (context, stateCatGet) {
          if (stateCatGet is CatGetSuccessState) {
            isLoaded = true;
            //when called api and there s nothing to show more
            //dispose scroll listener and stop to call api
            if (stateCatGet.listCats.isEmpty) {
              _scrollController
                ..removeListener(_onScroll)
                ..dispose();
              print("ScrollController was disposed because scroll to max");
            } else {
              listCats.addAll(stateCatGet.listCats);
            }
          } else if (stateCatGet is CatGetProgressState) {
            if (isLoaded == false) {
              return const Center(child: CircularProgressIndicator());
            }
          }
          return Column(
            children: [
              Flexible(
                child: ListView.builder(
                    controller: _scrollController,
                    physics: const ScrollPhysics(),
                    itemCount: listCats.length,
                    shrinkWrap: true,
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
                                  referenceImage:
                                      listCats[index].reference_image_id,
                                )
                                //put bloc provider here to close calls after conclude execution
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
                                  listCats[index].name,
                                  style: const TextStyle(color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    listCats[index].temperament,
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
              ),
              
              //this part is to show progress indicator back of the page
              isLoaded
                  ? stateCatGet is CatGetProgressState
                      ? const Center(child: CircularProgressIndicator())
                      : Container()
                  : Container()
            ],
          );
        },
      ),
    );
  }
}
