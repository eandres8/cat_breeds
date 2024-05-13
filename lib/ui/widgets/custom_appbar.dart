import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:catbreets/ui/blocs/cat-list/cat_list_cubit.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final textController = TextEditingController();
  final double height;

  CustomAppBar({super.key, required this.height});

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
                    child: _InputSearch(textController: textController),
                  ),
              ],
            ),
          ),
        ),
    );
  }
}

class _InputSearch extends StatelessWidget {
  final TextEditingController textController;

  const _InputSearch({required this.textController});

  @override
  Widget build(BuildContext context) {
    final catState = context.watch<CatListCubit>().state;
    final filterCatByName = context.read<CatListCubit>().filterCatByName;

    return TextFormField(
      controller: textController,
      onChanged: (value) {
        filterCatByName(value);
        textController.value = textController.value.copyWith(text: value);
      },
      decoration: InputDecoration(
        hintText: 'Search a cat by name',
        filled: true,
        border: InputBorder.none,
        suffixIcon: catState.name.isEmpty 
          ? const Icon(Icons.search)
          : IconButton(
            onPressed: () {
              filterCatByName('');
              textController.clear();
            },
            icon: const Icon(Icons.close),
          ),
        fillColor: Colors.black12,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    );
  }
}
