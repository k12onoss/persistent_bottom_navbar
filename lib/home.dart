import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:persistent_bottom_navbar/badge_visible_cubit.dart';
import 'package:persistent_bottom_navbar/cart/cart_cubit.dart';
import 'package:persistent_bottom_navbar/favorites/favorites.dart';
import 'package:persistent_bottom_navbar/favorites/favorites_cubit.dart';
import 'package:persistent_bottom_navbar/notifications/notifications.dart';
import 'package:persistent_bottom_navbar/notifications/notifications_cubit.dart';
import 'cart/cart.dart';

class Home extends StatelessWidget {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      backgroundColor: Colors.brown[400]!,
      items: [
        PersistentBottomNavBarItem(
          activeColorPrimary: Colors.white,
          icon: BlocBuilder<BadgeVisibleCubit, BadgeState>(
            builder: (context, state) => Badge(
              backgroundColor: Colors.pink,
              label: BlocBuilder<NotificationsCubit, int>(
                  builder: (context, state) => Text('$state')),
              isLabelVisible: state == BadgeState.notification,
              child: const Icon(Icons.notifications_active),
            ),
          ),
          inactiveIcon: const Icon(Icons.notifications_none),
          title: 'Notifications',
        ),
        PersistentBottomNavBarItem(
          activeColorPrimary: Colors.white,
          icon: BlocBuilder<BadgeVisibleCubit, BadgeState>(
            builder: (context, state) => Badge(
              backgroundColor: Colors.pink,
              label: BlocBuilder<CartCubit, int>(
                builder: (context, state) => Text('$state'),
              ),
              isLabelVisible: state == BadgeState.cart,
              child: const Icon(Icons.shopping_cart),
            ),
          ),
          inactiveIcon: const Icon(Icons.shopping_cart_outlined),
          title: 'Cart',
        ),
        PersistentBottomNavBarItem(
          activeColorPrimary: Colors.white,
          icon: BlocBuilder<BadgeVisibleCubit, BadgeState>(
            builder: (context, state) => Badge(
              backgroundColor: Colors.pink,
              label: BlocBuilder<FavoritesCubit, int>(
                builder: (context, state) => Text('$state'),
              ),
              isLabelVisible: state == BadgeState.favorites,
              child: const Icon(Icons.favorite),
            ),
          ),
          inactiveIcon: const Icon(Icons.favorite_border),
          title: 'Favorites',
        ),
      ],
      screens: const [
        Notifications(),
        Cart(),
        Favorites(),
      ],
      navBarStyle: NavBarStyle.style2,
      onItemSelected: (selectedIndex) {
        final cubit = BlocProvider.of<BadgeVisibleCubit>(context);
        if (selectedIndex == 0) {
          cubit.showNotification();
        } else if (selectedIndex == 1) {
          cubit.showCart();
        } else if (selectedIndex == 2) {
          cubit.showFavorites();
        }
      },
    );
  }
}
