import 'package:catbreets/domain/entities/cat.dart';

abstract class CatDatasource {
  Future<List<Cat>> requestCatList();
}