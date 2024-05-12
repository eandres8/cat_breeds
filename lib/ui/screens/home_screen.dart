import 'package:flutter/material.dart';

import 'package:catbreets/domain/models/cat_model.dart';
import 'package:catbreets/ui/widgets/cat_card.dart';
import 'package:catbreets/ui/widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(height: 100),
        body: Container(
          color: Colors.black12,
          padding: const EdgeInsets.all(10),
          child: ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemCount: 4,
            itemBuilder: (_, index) {
              final id = '${index + 1}';
              return CatCard(
                cat: Cat(
                  id: id,
                  country: 'Colombia',
                  image: 'https://http.cat/images/20$id.jpg',
                  intelligence: 10,
                  name: 'Cat $id',
                )
              );
            },
          ),
        ),
      );
  }
}