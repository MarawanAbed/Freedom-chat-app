
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/features/auth/forget_password/domain/use_cases/forget_password.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_state.dart';
part 'forget_password_cubit.freezed.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.forgetPasswordUseCase) : super(const ForgetPasswordState.initial());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  final ForgetPasswordUseCase forgetPasswordUseCase ;

  Future<void>forgetPassword(String email)async{
    emit(const ForgetPasswordState.loading());
    try{
      await forgetPasswordUseCase(email);
      emit(const ForgetPasswordState.success());
    }catch(e){
      emit(ForgetPasswordState.error(e.toString()));
    }
  }

  @override
  void emit(ForgetPasswordState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
