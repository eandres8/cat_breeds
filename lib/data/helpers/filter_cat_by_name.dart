import 'package:catbreets/domain/entities/cat.dart';

List<Cat> filterCatByName(String name, List<Cat> catList) {
  if (name.isEmpty) return catList;

  return catList
    .where((cat) => cat.name.toLowerCase().contains(name.toLowerCase()))
    .toList();
}