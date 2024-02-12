import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/core/di/dependancy_injection.dart';
import 'package:freedom_chat_app/core/services/notification_services.dart';
import 'package:freedom_chat_app/features/chat/data/models/message_model.dart';
import 'package:freedom_chat_app/features/chat/domain/use_cases/add_image_message.dart';
import 'package:freedom_chat_app/features/chat/domain/use_cases/add_text_message.dart';
import 'package:freedom_chat_app/features/chat/domain/use_cases/get_user_id.dart';
import 'package:freedom_chat_app/features/chat/domain/use_cases/upload_image.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/helpers/helper_methods.dart';

part 'send_messages_cubit.freezed.dart';

part 'send_messages_state.dart';

class SendMessagesCubit extends Cubit<SendMessagesState> {
  SendMessagesCubit(
      this._addImage, this._addText, this._getUserId, this._uploadImage)
      : super(const SendMessagesState.initial());

  static SendMessagesCubit get(context) => BlocProvider.of(context);
  final AddImageMessageUseCase _addImage;
  final AddTextMessageUseCase _addText;
  final GetUserIdUseCase _getUserId;

  final ChatsUploadImageUseCase _uploadImage;

  addMessageText(
      {required String content,
      required String receiverId,
      required UserModel user}) async {
    emit(const SendMessagesState.loading());
    try {
      final uId = _getUserId.call();
      final messageEntity = MessageModel(
        content: content,
        senderId: uId!,
        receiverId: receiverId,
        sendTime: DateTime.now(),
        messageType: MessageType.text,
      );
      await _addText.call(messageEntity);
      var receiverToken =
          await getIt<RemoteNotificationService>().getReceiverToken(receiverId);
      await getIt<RemoteNotificationService>().sendNotification(
        receiverToken: receiverToken,
        title: user.name!,
        body: content,
        senderId: uId,
      );
      emit(const SendMessagesState.loaded());
    } catch (e) {
      emit(SendMessagesState.error(message: e.toString()));
    }
  }

  addMessageImage({required String receiverId, required UserModel user}) async {
    emit(const SendMessagesState.loading());
    try {
      final image = await HelperMethod.getImageFromGallery();
      if (image != null) {
        final imageUrl = await _uploadImage(image);
        final uId = _getUserId.call();
        final messageEntity = MessageModel(
          content: imageUrl,
          senderId: uId!,
          receiverId: receiverId,
          sendTime: DateTime.now(),
          messageType: MessageType.image,
        );
        await _addImage.call(messageEntity);
        var receiverToken =await getIt<RemoteNotificationService>().getReceiverToken(receiverId);
        await getIt<RemoteNotificationService>().sendNotification(
          receiverToken: receiverToken,
          body: 'Image sent',
          title: user.name!,
          senderId: uId,
        );
        emit(const SendMessagesState.loaded());
      } else {
        emit(const SendMessagesState.error(message: 'Please pick an image'));
      }
    } catch (e) {
      emit(SendMessagesState.error(message: e.toString()));
    }
  }

  @override
  void emit(SendMessagesState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
