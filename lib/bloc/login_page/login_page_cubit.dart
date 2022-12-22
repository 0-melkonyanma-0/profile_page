import 'login_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit() : super(const LoginPageState(passVisible: true));

  void passVisible() {
    if (state.passVisible == true) {
      emit(const LoginPageState(passVisible: false));
    }
    else {
      emit(const LoginPageState(passVisible: true));
    }
  }
}
