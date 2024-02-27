mixin ScreenReceive {
  void receive(String message, dynamic value, {ScreenReceive? screen});
}

class ScreenReceiveArgs {
  final bool receive;
  final String identity;

  const ScreenReceiveArgs({
    required this.receive,
    required this.identity
  });
}