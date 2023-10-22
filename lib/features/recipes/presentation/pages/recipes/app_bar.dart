import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class RecipesAppBar extends AppBar {
  RecipesAppBar({
    required String titleText,
    required BuildContext context,
    super.key,
  }) : super(
          title: Text(
            titleText,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Ionicons.search_outline),
              ),
            ),
          ],
        );
}
