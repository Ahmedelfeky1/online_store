import 'package:supabase_flutter/supabase_flutter.dart';

class AuthServices {
  final supabase = Supabase.instance.client;

  Future<void> signUp({
    required String email,
    required String password,
    required String userName,
  }) async {
    final response = await supabase.auth.signUp(
      password: password,
      email: email,
      data: {'userName': userName},
    );
    if (response.user == null) {
      throw Exception("Sign up failed");
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    await supabase.auth.signInWithPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }
}
