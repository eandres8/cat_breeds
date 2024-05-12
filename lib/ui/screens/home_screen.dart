import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:catbreets/domain/entities/cat.dart';
import 'package:catbreets/ui/blocs/cat-list/cat_list_cubit.dart';
import 'package:catbreets/ui/widgets/cat_card.dart';
import 'package:catbreets/ui/widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  static String name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(height: 100),
      body: BlocBuilder<CatListCubit, CatListState>(
        builder: (_, snapshot) {
          if (snapshot.isLoading) {
            return const Center(child: CircularProgressIndicator(strokeWidth: 2)); 
          }

          return _HomeCatList(snapshot.catList);
        }
      ),
    );
  }
}

class _HomeCatList extends StatelessWidget {
  final List<Cat> catList;

  const _HomeCatList(this.catList);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.black12,
      padding: const EdgeInsets.all(10),
      child: catList.isNotEmpty
        ? ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemCount: catList.length,
            itemBuilder: (_, index) => CatCard(cat: catList[index]),
          )
        : const Center(child: Text('No cats found', style: TextStyle(fontSize: 16))),
    );
  }
}