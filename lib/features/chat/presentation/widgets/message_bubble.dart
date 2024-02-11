import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/themes/styles.dart';
import 'package:freedom_chat_app/core/utils/sizes.dart';
import 'package:freedom_chat_app/features/chat/data/models/message_model.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.user,
    required this.messageModel,
    required this.isMe,
  });

  final MessageModel messageModel;
  final UserModel user;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: AppSizes.kDefaultSymmetricVerticalPaddingS10,
          horizontal: AppSizes.kDefaultSymmetricHorizontalPaddingS5),
      child: Align(
        alignment: isMe ? Alignment.topLeft : Alignment.topRight,
        child: Container(
          decoration: BoxDecoration(
            color: isMe ? Colors.red[300] : Colors.blue[300],
            borderRadius: isMe
                ? BorderRadius.only(
                    topRight: Radius.circular(AppSizes.kDefaultBorderRadiusS30),
                    topLeft: Radius.circular(AppSizes.kDefaultBorderRadiusS30),
                    bottomRight:
                        Radius.circular(AppSizes.kDefaultBorderRadiusS30),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(AppSizes.kDefaultBorderRadiusS30),
                    topLeft: Radius.circular(AppSizes.kDefaultBorderRadiusS30),
                    bottomLeft:
                        Radius.circular(AppSizes.kDefaultBorderRadiusS30),
                  ),
          ),
          margin: EdgeInsets.only(
              top: AppSizes.kDefaultMarginS10,
              right: AppSizes.kDefaultMarginS10,
              left: AppSizes.kDefaultMarginS10),
          padding: EdgeInsets.all(AppSizes.kDefaultAllPaddingS10),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              if (messageModel.messageType == MessageType.image)
                Container(
                  height: AppSizes.imageHeight,
                  width: AppSizes.imageWidth,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppSizes.kDefaultBorderRadiusS15),
                    image: DecorationImage(
                      image: NetworkImage(messageModel.content!),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              else
                Text(
                  messageModel.content!,
                  style:
                      TextStyles.font16NormalGrey.copyWith(color: Colors.white),
                ),
              HelperMethod.verticalSpace(AppSizes.verticalSpacingS5),
              Text(
                timeago.format(messageModel.sendTime!),
                style:
                    TextStyles.font12NormalGrey.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
