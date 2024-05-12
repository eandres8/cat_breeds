import 'package:catbreets/domain/datasources/cat_datasource.dart';
import 'package:catbreets/domain/entities/cat.dart';
import 'package:catbreets/domain/repositories/cat_repository.dart';

class CatBreedsRepository extends CatRepository {
  final CatDatasource datasource;

  CatBreedsRepository(this.datasource);

  @override
  Future<List<Cat>> requestCatList() {
    return datasource.requestCatList();
  }
}
