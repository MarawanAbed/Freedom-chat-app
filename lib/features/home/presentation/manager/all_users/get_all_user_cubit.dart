import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freedom_chat_app/features/home/domain/use_cases/get_all_users.dart';
import 'package:freedom_chat_app/features/home/domain/use_cases/log_out.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_user_cubit.freezed.dart';

part 'get_all_user_state.dart';

class GetAllUserCubit extends Cubit<GetAllUserState> {
  GetAllUserCubit(this.getAllUsersUseCase, this.logOut)
      : super(const GetAllUserState.initial());

  static GetAllUserCubit get(context) => BlocProvider.of(context);

  final GetAllUsersUseCase getAllUsersUseCase;
  final HomeLogOutUseCase logOut ;

  void getAllUsers() async {
    emit(const GetAllUserState.loading());
    try {
      final users = getAllUsersUseCase();
      users.listen((event) {
        event.sort((a, b) => a.uId!.compareTo(b.uId!));
        event == null
            ? emit(const GetAllUserState.error("No users found"))
            :
        emit( GetAllUserState.success(event));
      });
    } catch (e) {
      emit(GetAllUserState.error(e.toString()));
    }
  }

  void logOutMethod() async {
    emit(const GetAllUserState.loading());
    try {
      await logOut.call();
    } catch (e) {
      emit(GetAllUserState.error(e.toString()));
    }
  }
  @override
  void emit(GetAllUserState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
