import 'package:bloc/bloc.dart';
import 'package:counter_bloc/login_states.dart';
import 'login_events.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitState()) {
    on<OnLoginEvent>((event, emit) async {
      emit(LoginLoadingState());

      await Future.delayed(const Duration(seconds: 3));

      if (event.user == "rafa" && event.password == "123") {
        emit(LoginLoadedState());
      } else {
        emit(LoginErrorState());
      }
    });
  }
}
