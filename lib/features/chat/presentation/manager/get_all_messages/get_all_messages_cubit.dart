import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/features/chat/data/models/message_model.dart';
import 'package:freedom_chat_app/features/chat/domain/use_cases/get_all_messages.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_messages_cubit.freezed.dart';

part 'get_all_messages_state.dart';

class GetAllMessagesCubit extends Cubit<GetAllMessagesState> {
  GetAllMessagesCubit(this._getAllMessagesUseCase)
      : super(const GetAllMessagesState.initial());

  static GetAllMessagesCubit get(context) => BlocProvider.of(context);
  final GetAllMessagesUseCase _getAllMessagesUseCase;
  getAllMessage({required String receiverId}) async {
    emit(const GetAllMessagesState.loading());
    print(receiverId);
    try {
      _getAllMessagesUseCase.call(receiverId).listen((event) {
        emit(GetAllMessagesState.loaded(event));
      });

    } catch (e) {
      emit(GetAllMessagesState.error(message: e.toString()));
    }
  }

  @override
  void emit(GetAllMessagesState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
