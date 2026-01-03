import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/cubit/cubit/appauth_cubit.dart';
import 'package:online_shop/presentation/screens/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://huafvrbvcjljwtkymnzu.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh1YWZ2cmJ2Y2psand0a3ltbnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjczNjM1NDcsImV4cCI6MjA4MjkzOTU0N30.YpriKxYcdtdGWVW1EAo3q1mge3Sdf1Ifov8Yz9H3MtY",
  );
  runApp(const onLineStore());
}

class onLineStore extends StatelessWidget {
  const onLineStore({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppauthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Online Shop",
        home: SplashScreen(),
      ),
    );
  }
}
