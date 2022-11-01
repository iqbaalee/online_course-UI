class BottomMenus {
  String menu;
  String icon;
  String iconActive;
  bool selected;
  int badge;
  double width;
  double height;

  BottomMenus(
    this.menu,
    this.icon, {
    this.iconActive = '',
    this.selected = false,
    this.badge = 0,
    this.width = 0,
    this.height = 0,
  });
}
