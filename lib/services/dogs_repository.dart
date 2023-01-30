import 'package:adopt_pet_app/core/endpoints.dart';
import 'package:adopt_pet_app/models/dog_model/dog.dart';
import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

abstract class DogsRepository {
  Future<Result<List<Dog>, String>> getDogsList();
}

class DogsRepo implements DogsRepository {
  @override
  Future<Result<List<Dog>, String>> getDogsList() async {
    List<Dog> listDogs = [];

    String endpointDogsList =
        Endpoints.baseUrlDog + Endpoints.v1 + Endpoints.dogList;
    Map<String, dynamic> header = {
      "YOUR-API-KEY": Endpoints.apiKey,
      "limit": 15,
    };
    //Map<String, dynamic> params = {};
    try {
      Response response =
          await Dio().get(endpointDogsList, queryParameters: header);

      for (var dog in response.data) {
        listDogs.add(Dog.fromMap(dog));
      }
      if (listDogs.isEmpty) {
        return const Failure("Não há dados a serem mostrados");
      }
      return Success(listDogs);
    } catch (e) {
      return Failure("$e");
    }
  }
}
