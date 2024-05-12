import 'package:catbreets/domain/entities/cat.dart';

abstract class CatRepository {
  Future<List<Cat>> requestCatList();
}