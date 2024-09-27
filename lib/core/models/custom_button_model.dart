class CustomButtonModel {
  final Function() onTap;
  final String buttonName;
  final bool isLoading;
  final double? width;

  CustomButtonModel(
      {required this.onTap,
      required this.buttonName,
      this.isLoading = false,
      this.width});
}
