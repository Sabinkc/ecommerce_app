import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/auth/model/user.dart';
import 'package:ecommerce_app/features/auth/resources/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<CommonState> {
  final UserRepository userRepository;
  LoginCubit({required this.userRepository}) : super(CommonInitialState());

  login({
    required String password, 
    required String email,
    }) async {
    emit(CommonLoadingState());
    final res = await userRepository.login(password: password, email: email);

    if(res.status){
      emit(CommonSuccessState<User>(data: res.data!));
    }else{
      emit(CommonErrorState(message: res.message));
    }
  }
}