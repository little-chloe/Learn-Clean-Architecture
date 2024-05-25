import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_clean_architecture/configs/routes/routes.dart';
import 'package:learn_clean_architecture/configs/themes/app_theme.dart';
import 'package:learn_clean_architecture/features/daily_news/presentation/blocs/article/remote/remote_article_bloc.dart';
import 'package:learn_clean_architecture/features/daily_news/presentation/blocs/article/remote/remote_article_event.dart';
import 'package:learn_clean_architecture/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:learn_clean_architecture/injection_container.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RenmoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          home: const DailyNews(),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
        ),
      ),
    );
  }
}
