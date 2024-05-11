import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CustomAppBar({super.key, required this.height});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SafeArea(
      bottom: false,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Text('Catbreeds', style: titleStyle),
                const SizedBox(height: 5),
                TextFormField(
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    hintText: 'Search your preferred cat',
                    filled: true,
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                    fillColor: Colors.black12,
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
