import 'package:delishy/core/di/injector.dart';
import 'package:delishy/core/network/request_status.dart';
import 'package:delishy/features/recipes/presentation/manager/daily_recipe/daily_recipe_bloc.dart';
import 'package:delishy/features/recipes/presentation/pages/recipes/daily_recipe/failure.dart';
import 'package:delishy/features/recipes/presentation/pages/recipes/daily_recipe/loading.dart';
import 'package:delishy/features/recipes/presentation/pages/recipes/daily_recipe/success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyRecipe extends StatelessWidget {
  const DailyRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DailyRecipeBloc(
        Injector.getIt!.get(),
      ),
      child: const DailyRecipeView(),
    );
  }
}

class DailyRecipeView extends StatefulWidget {
  const DailyRecipeView({super.key});

  @override
  State<DailyRecipeView> createState() => _DailyRecipeViewState();
}

class _DailyRecipeViewState extends State<DailyRecipeView> {
  @override
  void initState() {
    context.read<DailyRecipeBloc>().add(const DailyRecipeRequested());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyRecipeBloc, DailyRecipeState>(
      builder: (context, state) {
        if (state.status == RequestStatus.loading) {
          return const DailyRecipeLoading();
        } else if (state.status == RequestStatus.failure) {
          return const DailyRecipeFailure();
        } else if (state.status == RequestStatus.success) {
          return DailyRecipeSuccess(meal: state.meal);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
