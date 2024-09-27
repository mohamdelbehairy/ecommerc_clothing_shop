class AuthItemModel {
  final String icon;
  final String text;
  final Function() onTap;
  final bool isLoading;

  AuthItemModel(
      {required this.icon,
      required this.text,
      required this.onTap,
      this.isLoading = false});
}
