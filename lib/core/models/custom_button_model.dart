class CustomButtonModel {
  final Function() onTap;
  final String buttonName;
  final bool isLoading;

  CustomButtonModel(
      {required this.onTap, required this.buttonName, this.isLoading = false});
}
