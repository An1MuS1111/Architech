import 'package:architech/login.dart';
import 'package:go_router/go_router.dart';

final _routers = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Login()
    )
  ]
);