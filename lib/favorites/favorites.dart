import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_navbar/favorites/favorites_cubit.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: const Text('Favorites'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pink),
              ),
              onPressed: () =>
                  BlocProvider.of<FavoritesCubit>(context).incrementCounter(),
              child: const Text('Increment'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pink),
              ),
              onPressed: () =>
                  BlocProvider.of<FavoritesCubit>(context).decrementCounter(),
              child: const Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }
}
