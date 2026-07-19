import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inmediam/core/services/feedback_service.dart';
import 'package:inmediam/features/auth/presentation/pages/login_page.dart';
import 'package:inmediam/features/inspection/presentation/bloc/inspection_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InspectionBloc(),
      child: MaterialApp(
        title: 'InspectApp',
        scaffoldMessengerKey: FeedbackService.messengerKey,
        theme: ThemeData(
          primaryColor: const Color(0xFFF15A24),
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF15A24)),
          useMaterial3: true,
        ),
        home: const LoginPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
