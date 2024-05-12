import 'package:flutter/material.dart';

import 'package:catbreets/domain/entities/cat.dart';

class DetailsScreen extends StatelessWidget {
  static String name = 'details-screen';
  final String title;

  const DetailsScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final cat = Cat(
      id: '418',
      country: 'Colombia',
      image: 'https://http.cat/images/418.jpg',
      intelligence: 10,
      name: 'Cat 418',
      affection: 1,
      description: 'Mollit nulla amet magna voluptate irure nisi duis duis qui non sunt irure. Veniam reprehenderit nisi fugiat tempor adipisicing aliqua elit ea occaecat. Veniam deserunt eu elit adipisicing. Amet mollit incididunt ad tempor pariatur adipisicing cillum reprehenderit. Ipsum non commodo dolor cupidatat elit et mollit proident et nostrud id adipisicing. Deserunt exercitation amet est duis duis sunt.',
      energy: 1,
      personality: [],
    );
    
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
        title: Text(cat.name, style:  titleStyle,),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 350,
            child: Image.network(cat.image, fit: BoxFit.cover)
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                    children: [
                      const Text(
                        'Qui occaecat excepteur anim anim. Consectetur ea sunt sit consequat elit culpa eiusmod. Ipsum incididunt velit incididunt ipsum. Mollit qui dolore ad minim do mollit exercitation labore incididunt ullamco. Minim ex est id laborum officia.',
                        style: TextStyle(fontSize: 18),
                      ),
              
                      const SizedBox(height: 10),
              
                      _ItemDetail(label: 'Nombre del país', value: cat.name),
                      _ItemDetail(label: 'Nombre del país', value: cat.name),
                      _ItemDetail(label: 'Nombre del país', value: cat.name),
                      _ItemDetail(label: 'Nombre del país', value: cat.name),

                      const SizedBox(height: 30),
                      
                    ],
                  ),
              ),
            ),
          ),
        ]
      ),
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
      title: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      trailing: Text(value, style: const TextStyle(fontSize: 14)),
    );
  }
}