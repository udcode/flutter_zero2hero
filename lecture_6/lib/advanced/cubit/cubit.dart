import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()){
    on<AuthEvent>(mapEventToState);
  }


   mapEventToState(AuthEvent event,Emitter<AuthState> emit) async {
    if (event is LoginEvent) {
      emit( AuthLoading());
      await Future.delayed(Duration(seconds: 2)); // Simulate login delay

      if (event.username == "user" && event.password == "password") {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure("Invalid credentials"));
      }
    } else if (event is LogoutEvent) {
      emit( AuthInitial());
    }
    emit(AuthLoaded());
  }
}
