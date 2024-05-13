part of 'cat_list_cubit.dart';

sealed class CatListState extends Equatable {
  final bool isLoading;
  final String name;
  final List<Cat> catList;

  const CatListState({
    required this.catList,
    this.isLoading = false,
    this.name = '',
  });

  @override
  List<Object> get props => [catList, isLoading, name];
}

final class CatListIdle extends CatListState {
  CatListIdle(): super(catList: [], isLoading: false, name: '');
}

final class CatListLoading extends CatListState {
  CatListLoading(bool isLoading): super(catList: [], isLoading: isLoading, name: '');
}

final class CatListSetted extends CatListState {
  const CatListSetted({
    required super.catList,
    super.isLoading,
  }): super();
}

final class CatListFiltered extends CatListState {
  const CatListFiltered({
    required super.catList,
    required super.name,
  });
}
