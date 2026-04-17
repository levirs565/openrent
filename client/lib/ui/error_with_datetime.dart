class ErrorWithDateTime {
  final String message;
  final DateTime dateTime;

  ErrorWithDateTime({required this.message, required this.dateTime});

  ErrorWithDateTime.current({required this.message})
    : dateTime = DateTime.now();
}
