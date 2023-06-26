import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<int> {
  CartCubit() : super(0);

  void incrementCounter() => emit(state + 1);

  void decrementCounter() => emit(state - 1);
}
