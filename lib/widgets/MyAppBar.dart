import 'package:flutter/material.dart';

/// 自定义appbar
class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final Widget title;
  final double elevation;
  final Widget leading;
  final Color backgroundColor;
  final bool centerTitle;
  final bool automaticallyImplyLeading;

  MyAppBar(
      {Key key,
      this.actions,
      this.title,
      this.elevation = 0.0,
      this.leading,
      this.backgroundColor,
      this.centerTitle,
      this.automaticallyImplyLeading = true})
      : super(key: key);

  @override
  Size get preferredSize => new Size.fromHeight(48.0);

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: widget.actions,
      title: widget.title,
      elevation: widget.elevation,
      leading: widget.leading,
      backgroundColor: widget.backgroundColor,
      centerTitle: widget.centerTitle,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
    );
  }
}
