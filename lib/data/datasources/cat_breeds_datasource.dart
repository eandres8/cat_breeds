import 'package:catbreets/domain/entities/cat.dart';
import 'package:dio/dio.dart';

import 'package:catbreets/core/constants/environment.dart';
import 'package:catbreets/domain/datasources/cat_datasource.dart';
import 'package:catbreets/data/mappers/cat_mapper.dart';
import 'package:catbreets/data/models/http/cat_response.dart';

class CatBreedsDatasource extends CatDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.baseUrl,
    queryParameters: {
      'x-api-key': Environment.apiKey,
    }));

  @override
  Future<List<Cat>> requestCatList() async {
    final response = await dio.get('/breeds');

    final catResponseList = CatResponse.fromJson(response.data!);
    final catList = CatMapper.catResponseToEntity(catResponseList);

    return catList;
  }
}