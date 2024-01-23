import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freedom_chat_app/features/home/domain/use_cases/get_user.dart';
import 'package:freedom_chat_app/features/home/domain/use_cases/user_uid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_cubit.freezed.dart';

part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit(this.getUserUseCase, this.userUid) : super(const GetUserState.initial());

  static getUserCubit(context) => BlocProvider.of<GetUserCubit>(context);
  final GetUserUseCase getUserUseCase;
  final UserUidUseCase userUid;
  void getUser(String uid) {
    emit(const GetUserState.loading());
    try {
      final user = getUserUseCase(uid);
      user.listen((event) {
        emit(GetUserState.success(event));
      });
    } catch (e) {
      emit(GetUserState.error(e.toString()));
    }
  }

  String? getCurrentUserId() {
    return userUid();
  }

  @override
  void emit(GetUserState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
