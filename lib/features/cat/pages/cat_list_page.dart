// ignore_for_file: public_member_api_docs, sort_constructors_first, invalid_use_of_protected_member
import 'package:adopt_pet_app/features/cat/components/cat_show_component.dart';
import 'package:adopt_pet_app/models/cat_model/cat.dart';
import 'package:another_flushbar/flushbar_helper.dart';
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
  bool scrollDisposed = false;

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
    //reinitialize cat bloc state
    BlocProvider.of<CatGetBloc>(context).add(CatResetInicialStateEvent());

    //verify if scroll was disposed
    if (!scrollDisposed) {
      _scrollController
        ..removeListener(_onScroll)
        ..dispose();

      print("ScrollController was disposed because of return page");
    }
    super.deactivate();
  }

  //function to call api if scroll to max on the screen
  void _onScroll() {
    if (_isBottom) {
      setState(() {
        numberPage++;
      });
      context.read<CatGetBloc>().add(CatGetListEvent(numberPage, order));
    }
  }

  // verify if  scroll to max on the screen
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
              scrollDisposed = true;

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
                    itemCount: listCats.length + 1,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          index >= listCats.length
                              ? scrollDisposed
                                  ? Container()
                                  : const CircularProgressIndicator()
                              : CatShowComponent(listCats: listCats[index]),
                        ],
                      );
                    }),
              ),
            ],
          );
        },
      ),
    );
  }
}
