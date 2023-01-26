import 'package:adopt_pet_app/features/dog/bloc/dog_get_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogListPage extends StatefulWidget {
  const DogListPage({Key? key}) : super(key: key);

  @override
  State<DogListPage> createState() => _DogListPageState();
}

class _DogListPageState extends State<DogListPage> {
  @override
  void initState() {
    //start call dog list here
    BlocProvider.of<DogGetBloc>(context).add(DogGetListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de cachorros para adoção"),
      ),
      body: BlocBuilder<DogGetBloc, DogGetState>(
        builder: (context, stateDogGet) {
          if (stateDogGet is DogGetSuccessState) {
            return Container(
              child: ListView.builder(
                  itemCount: stateDogGet.listDogs.length,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1, color: Colors.black)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            stateDogGet.listDogs[index].name,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  }),
            );
          } else if (stateDogGet is DogGetProgressState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Text("Houve algum erro de execução");
          }
        },
      ),
    );
  }
}
