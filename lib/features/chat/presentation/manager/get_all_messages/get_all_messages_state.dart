part of 'get_all_messages_cubit.dart';

@freezed
class GetAllMessagesState with _$GetAllMessagesState {
  const factory GetAllMessagesState.initial() = _Initial;

  const factory GetAllMessagesState.loading() = Loading;

  const factory GetAllMessagesState.loaded(List<MessageModel>messages) = Loaded;

  const factory GetAllMessagesState.error({required String message}) = Error;
}
