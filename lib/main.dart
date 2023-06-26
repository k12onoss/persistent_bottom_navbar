import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_navbar/badge_visible_cubit.dart';
import 'package:persistent_bottom_navbar/cart/cart_cubit.dart';
import 'package:persistent_bottom_navbar/favorites/favorites_cubit.dart';
import 'package:persistent_bottom_navbar/home.dart';
import 'package:persistent_bottom_navbar/notifications/notifications_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NotificationsCubit()),
          BlocProvider(create: (context) => CartCubit()),
          BlocProvider(create: (context) => FavoritesCubit()),
          BlocProvider(create: (context) => BadgeVisibleCubit()),
        ],
        child: Home(),
      ),
    );
  }
}
