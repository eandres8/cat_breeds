import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:catbreets/domain/entities/cat.dart';

class CatCard extends StatelessWidget {
  final Cat cat;

  const CatCard({
    super.key,
    required this.cat,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
        color: Colors.white,
        child: SizedBox(
          height: 350,
          child: Stack(
            children: [
              Stack(
              alignment: Alignment.topCenter,
              children: [
                //* Card Image
                SizedBox.expand(
                  child: Image.network(
                    cat.image,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Image.network('https://http.cat/images/404.jpg'),
                  ),
                ),
      
                //* Info Options
                SizedBox.expand(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          title: Text(cat.name),
                          trailing: GestureDetector(
                            onTap: () {
                              context.push('/details/${cat.id}');
                            },
                            child: const Text('Más...')
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          title: Text('Country: ${cat.country}'),
                          trailing: Text('Intelligence: ${cat.intelligence}'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }
}
