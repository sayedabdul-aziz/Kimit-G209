class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final bool isOnline;

  ChatModel(
      {required this.name,
      required this.message,
      required this.time,
      required this.avatarUrl,
      required this.isOnline});
}

List<ChatModel> users = [
  ChatModel(
      name: 'Ahmed Ali',
      message: 'Hello, Ahmed Ali.',
      time: '11:30 AM',
      avatarUrl: 'https://i.pravatar.cc/300',
      isOnline: true),
  ChatModel(
      name: 'Tarek Ali',
      message: 'Hello, Tarek Ali.',
      time: '01:30 AM',
      avatarUrl: 'https://i.pravatar.cc/400',
      isOnline: false),
  ChatModel(
      name: 'Ahmed Sayed Zezo',
      message: 'Hello, Zizo. U are the best Player In Africa',
      time: '09:30 AM',
      avatarUrl: 'https://i.pravatar.cc/400',
      isOnline: true),
  ChatModel(
      name: 'Mohammed Ali',
      message: 'Hello, Mo',
      time: '19:30 AM',
      avatarUrl: 'https://i.pravatar.cc/200',
      isOnline: false),
  ChatModel(
      name: 'Ahmed Ali',
      message: 'Hello, Ahmed Ali.',
      time: '11:30 AM',
      avatarUrl: 'https://i.pravatar.cc/300',
      isOnline: true),
  ChatModel(
      name: 'Tarek Ali',
      message: 'Hello, Tarek Ali.',
      time: '01:30 AM',
      avatarUrl: 'https://i.pravatar.cc/400',
      isOnline: false),
  ChatModel(
      name: 'Ahmed Sayed Zezo',
      message: 'Hello, Zizo. U are the best Player In Africa',
      time: '09:30 AM',
      avatarUrl: 'https://i.pravatar.cc/600',
      isOnline: true),
  ChatModel(
      name: 'Mohammed Ali',
      message: 'Hello, Mo',
      time: '19:30 AM',
      avatarUrl: 'https://i.pravatar.cc/800',
      isOnline: false),
];
