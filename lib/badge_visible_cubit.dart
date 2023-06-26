import 'package:flutter_bloc/flutter_bloc.dart';

enum BadgeState {
  notification,
  cart,
  favorites,
}

class BadgeVisibleCubit extends Cubit<BadgeState> {
  BadgeVisibleCubit() : super(BadgeState.notification);

  void showNotification() => emit(BadgeState.notification);

  void showCart() => emit(BadgeState.cart);

  void showFavorites() => emit(BadgeState.favorites);
}
