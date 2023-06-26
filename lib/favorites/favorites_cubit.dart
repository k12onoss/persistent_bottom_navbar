import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<int> {
  FavoritesCubit() : super(0);

  void incrementCounter() => emit(state + 1);

  void decrementCounter() => emit(state - 1);
}
