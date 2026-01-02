import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_shop/data/services/auth_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as Supabase;

part 'appauth_state.dart';

class AppauthCubit extends Cubit<AppauthState> {
  AuthServices authServices = AuthServices();
  AppauthCubit() : super(AppauthInitial());
  Future<void> signUp({
    required String email,
    required String password,
    required String userName,
  }) async {
    emit(AppauthLoading());
    try {
      await authServices.signUp(
        email: email,
        password: password,
        userName: userName,
      );
      emit(AppauthSuccess());
    } catch (e) {
      emit(AppauthError(errorMessage: e.toString()));
    }
  }

  Future<void> logIn({required String email, required String password}) async {
    emit(AppauthLoading());
    try {
      await authServices.signIn(email: email, password: password);
      emit(AppauthSuccess());
    } on Supabase.AuthException catch (e) {
      emit(AppauthError(errorMessage: e.message));
    } catch (e) {
      emit(AppauthError(errorMessage: e.toString()));
    }
  }

  Future<void> logOut() async {
    emit(AppauthLoading());
    await authServices.signOut();
    emit(AppauthSuccess());
  }
}
