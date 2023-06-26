import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_navbar/cart/cart_cubit.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.brown[400],
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
                  BlocProvider.of<CartCubit>(context).incrementCounter(),
              child: const Text('Increment'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pink),
              ),
              onPressed: () =>
                  BlocProvider.of<CartCubit>(context).decrementCounter(),
              child: const Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }
}
