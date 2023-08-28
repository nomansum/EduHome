class NotificationModel {
  final String senderId;
  final String recipientId;
  final String messageType;
  final String message;

  NotificationModel({
    required this.senderId,
    required this.recipientId,
    required this.messageType,
    required this.message,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      senderId: json['senderId'],
      recipientId: json['recipientId'],
      messageType: json['messageType'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'recipientId': recipientId,
      'messageType': messageType,
      'message': message,
    };
  }
}
