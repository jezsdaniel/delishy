import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:delishy/core/errors/failure.dart';
import 'package:delishy/core/network/request_status.dart';
import 'package:delishy/core/use_cases/use_case.dart';
import 'package:delishy/features/recipes/data/models/responses/random_meal.dart';
import 'package:delishy/features/recipes/domain/use_cases/get_random_meal_mock.dart';
import 'package:delishy/features/recipes/presentation/manager/daily_recipe/daily_recipe_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../data/mocks/random_meal.dart';

void main() {
  group('DailyRecipeBloc', () {
    late DailyRecipeBloc dailyRecipeBloc;
    final mockGetRandomMealUseCase = MockGetRandomMealUseCase();

    setUp(() {
      dailyRecipeBloc = DailyRecipeBloc(mockGetRandomMealUseCase);
    });

    blocTest<DailyRecipeBloc, DailyRecipeState>(
      'emits loading and success states when GetRandomMealUseCase returns a meal',
      build: () {
        when(() => mockGetRandomMealUseCase(NoParams())).thenAnswer(
          (_) async => const Right<Failure, RandomMealResponseModel>(
            randomMealEntityMock,
          ),
        );
        return dailyRecipeBloc;
      },
      act: (bloc) => bloc.add(const DailyRecipeRequested()),
      expect: () => [
        const DailyRecipeState(status: RequestStatus.loading),
        DailyRecipeState(
          status: RequestStatus.success,
          meal: randomMealEntityMock.meal,
        )
      ],
    );

    blocTest<DailyRecipeBloc, DailyRecipeState>(
      'emits loading and failure states when GetRandomMealUseCase returns an error',
      build: () {
        when(() => mockGetRandomMealUseCase(NoParams())).thenAnswer(
          (_) async => Left(Failure()),
        );
        return dailyRecipeBloc;
      },
      act: (bloc) => bloc.add(const DailyRecipeRequested()),
      expect: () => [
        const DailyRecipeState(status: RequestStatus.loading),
        const DailyRecipeState(status: RequestStatus.failure),
      ],
    );
  });
}
