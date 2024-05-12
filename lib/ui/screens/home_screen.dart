import 'package:flutter/material.dart';

import 'package:catbreets/domain/entities/cat.dart';
import 'package:catbreets/ui/widgets/cat_card.dart';
import 'package:catbreets/ui/widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  static String name = 'home-screen';

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
            itemCount: 6,
            itemBuilder: (_, index) {
              final id = '${index + 1}';
              return CatCard(
                cat: Cat(
                  id: id,
                  country: 'Colombia',
                  image: 'https://http.cat/images/20$id.jpg',
                  intelligence: 10,
                  name: 'Cat 20$id',
                  affection: 1,
                  description: 'Mollit nulla amet magna voluptate irure nisi duis duis qui non sunt irure. Veniam reprehenderit nisi fugiat tempor adipisicing aliqua elit ea occaecat. Veniam deserunt eu elit adipisicing. Amet mollit incididunt ad tempor pariatur adipisicing cillum reprehenderit. Ipsum non commodo dolor cupidatat elit et mollit proident et nostrud id adipisicing. Deserunt exercitation amet est duis duis sunt.',
                  energy: 1,
                  personality: [],
                ),
              );
            },
          ),
        ),
      );
  }
}