import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:catbreets/core/constants/not_found.dart';
import 'package:catbreets/domain/entities/cat.dart';
import 'package:catbreets/ui/blocs/cat-list/cat_list_cubit.dart';

class DetailsScreen extends StatelessWidget {
  static String name = 'details-screen';
  final String id;

  const DetailsScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final catListCubit = context.watch<CatListCubit>();

    final cat = catListCubit.getCatById(id);

    return _CatDetails(cat: cat);
  }
}

class _CatDetails extends StatelessWidget {
  final Cat cat;

  const _CatDetails({
    required this.cat,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          cat.name,
          style: titleStyle,
        ),
      ),
      body: Column(children: [
        //* Image
        SizedBox(
          height: 350,
          child: Image.network(
            cat.image,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Image.network(IMG_NO_FOUND),
          )
        ),

        //* Details Information Scroll
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    cat.description,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  _ItemDetail(label: 'Country', value: cat.country),
                  _ItemDetail(label: 'Lifespan', value: '${cat.lifespan} years'),
                  _ItemDetail(label: 'Intelligence', value: '${cat.intelligence}/10'),
                  _ItemDetail(label: 'Energy', value: '${cat.energy}/10'),
                  _ItemDetail(label: 'Friendship', value: '${cat.affection}/10'),
                  
                  const SizedBox(height: 10),
                  _CatPersonality(personalityItems: cat.personality),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class _ItemDetail extends StatelessWidget {
  final String label;
  final String value;

  const _ItemDetail({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
      trailing: Text(value, style: const TextStyle(fontSize: 16)),
    );
  }
}

class _CatPersonality extends StatelessWidget {
  final List<String> personalityItems;

  const _CatPersonality({required this.personalityItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Personality',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              ...personalityItems.map((pi) => ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 5),
                    color: const Color(0xFF2196F3),
                    child: Text(
                      pi,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ],
    );
  }
}
