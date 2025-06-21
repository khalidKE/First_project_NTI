import 'package:first_app/BMI_APP/Core/features/presentation/Ui_srcreen/bmi_welcome_screen.dart';
import 'package:first_app/BMI_APP/Core/features/presentation/controllers/git_bmi/cubit/bmi_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const FirstApp());
}

/// we use context to access the widget tree
/// and to get the current state of the widget
class FirstApp extends StatelessWidget {
  const FirstApp({super.key});

  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiResultCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const BmiWelcomeScreen(),
      ),
    );
  }
}
