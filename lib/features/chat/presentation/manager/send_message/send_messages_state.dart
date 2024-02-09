part of 'send_messages_cubit.dart';

@freezed
class SendMessagesState with _$SendMessagesState {
  const factory SendMessagesState.initial() = _Initial;

  const factory SendMessagesState.loading() = Loading;

  const factory SendMessagesState.loaded() = Loaded;

  const factory SendMessagesState.error({required String message}) = Error;
}
