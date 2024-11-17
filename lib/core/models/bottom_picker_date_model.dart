class BottomPickerDateModel {
  final DateTime? initialDateTime;
  final Function(dynamic)? onSubmit;
  final String age;

  BottomPickerDateModel({this.initialDateTime, this.onSubmit, this.age = ""});
}
