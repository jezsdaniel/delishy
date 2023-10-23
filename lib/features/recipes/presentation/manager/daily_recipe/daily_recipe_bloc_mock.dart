import 'package:bloc_test/bloc_test.dart';
import 'package:delishy/features/recipes/presentation/manager/daily_recipe/daily_recipe_bloc.dart';

class DailyRecipeBlocMock extends MockBloc<DailyRecipeEvent, DailyRecipeState>
    implements DailyRecipeBloc {}
