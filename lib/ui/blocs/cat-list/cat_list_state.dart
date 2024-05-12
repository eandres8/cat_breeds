part of 'cat_list_cubit.dart';

sealed class CatListState extends Equatable {
  final bool isLoading;
  final List<Cat> catList;

  const CatListState({
    required this.catList,
    this.isLoading = false,
  });

  @override
  List<Object> get props => [catList, isLoading];
}

final class CatListIdle extends CatListState {
  CatListIdle(): super(catList: [], isLoading: false);
}

final class CatListLoading extends CatListState {
  CatListLoading(bool isLoading): super(catList: [], isLoading: isLoading);
}

final class CatListSetted extends CatListState {
  const CatListSetted({
    required super.catList,
    required super.isLoading,
  });
}
