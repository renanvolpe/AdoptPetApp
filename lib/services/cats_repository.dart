import 'package:adopt_pet_app/core/endpoints.dart';
import 'package:adopt_pet_app/models/cat_model/cat.dart';
import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

abstract class CatsRepository {
  Future<Result<List<Cat>, String>> getCatsList();
  Future<Result<String, String>> getCatImage(String id);
}

class CatsRepo implements CatsRepository {
  @override
  Future<Result<List<Cat>, String>> getCatsList() async {
    List<Cat> listCats = [];

    String endpointCatsList =
        Endpoints.baseUrlCat + Endpoints.v1 + Endpoints.dogList;
    Map<String, dynamic> header = {
      "YOUR-API-KEY": Endpoints.apiKey,
      "limit": 10,
    };
    //Map<String, dynamic> params = {};
    try {
      Response response =
          await Dio().get(endpointCatsList, queryParameters: header);

      for (var dog in response.data) {
        listCats.add(Cat.fromMap(dog));
      }
      if (listCats.isEmpty) {
        return const Failure("Não há dados a serem mostrados");
      }
      return Success(listCats);
    } catch (e) {
      return Failure("$e");
    }
  }

  @override
  Future<Result<String, String>> getCatImage(String id) async {
    String catImage = "";

    String endpointCatsList =
        Endpoints.baseUrlCat + Endpoints.v1 + Endpoints.images + id;
    Map<String, dynamic> header = {
      "YOUR-API-KEY": Endpoints.apiKey,
    };
    //Map<String, dynamic> params = {};
    try {
      Response response =
          await Dio().get(endpointCatsList, queryParameters: header);

      catImage = response.data["url"];

      if (catImage.isEmpty) {
        return const Failure("Sem image");
      }
      return Success(catImage);
    } catch (e) {
      return Failure("$e");
    }
  }
}
