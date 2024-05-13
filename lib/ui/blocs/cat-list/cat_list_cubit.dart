import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:catbreets/data/datasources/cat_breeds_datasource.dart';
import 'package:catbreets/data/repositories/cat_breeds_repository.dart';
import 'package:catbreets/domain/repositories/cat_repository.dart';
import 'package:catbreets/domain/entities/cat.dart';

part 'cat_list_state.dart';

class CatListCubit extends Cubit<CatListState> {
  final CatRepository repository = CatBreedsRepository(CatBreedsDatasource());

  CatListCubit() : super(CatListIdle());

  Cat getCatById(String id) {
    return state.catList.singleWhere((cat) => cat.id == id);
  }

  Future<void> requestCatList() async {
    emit(CatListLoading(true));
    final catList = await repository.requestCatList();

    emit(CatListSetted(catList: catList, isLoading: false));
  }

  void filterCatByName(String name) {
    emit(CatListFiltered(name: name, catList: state.catList));
  }
}
