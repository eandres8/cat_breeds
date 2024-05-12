import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:catbreets/ui/blocs/cat-list/cat_list_cubit.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CustomAppBar({super.key, required this.height});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final catState = context.watch<CatListCubit>().state;
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

                if (!catState.isLoading)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: TextFormField(
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        hintText: 'Search your cat',
                        filled: true,
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search),
                        fillColor: Colors.black12,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
    );
  }
}
