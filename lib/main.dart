import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pony_store/config/constants/environment.dart';
import 'package:pony_store/config/router/app_router.dart';
import 'package:pony_store/config/theme/app_theme.dart';

Future<void> main() async {
  await Environment.initEnvironment();

  runApp(const ProviderScope(child: PonyStore()));
}

class PonyStore extends ConsumerWidget {
  const PonyStore({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
