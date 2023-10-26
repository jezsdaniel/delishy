import 'package:delishy/core/network/request_status.dart';
import 'package:delishy/features/favorites/presentation/manager/favorites/favorites_bloc.dart';
import 'package:delishy/features/favorites/presentation/pages/favorites/empty.dart';
import 'package:delishy/features/favorites/presentation/pages/favorites/failure.dart';
import 'package:delishy/features/favorites/presentation/pages/favorites/loading.dart';
import 'package:delishy/features/favorites/presentation/pages/favorites/success.dart';
import 'package:delishy/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FavoritesView();
  }
}

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l11n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l11n.favoriteRecipes,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          if (state.status == RequestStatus.loading) {
            return const FavoritesLoading();
          } else if (state.status == RequestStatus.failure) {
            return const FavoritesFailure();
          } else if (state.status == RequestStatus.success &&
              state.favorites.isEmpty) {
            return const FavoritesEmpty();
          } else if (state.status == RequestStatus.success) {
            return FavoritesSuccess(favorites: state.favorites);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
