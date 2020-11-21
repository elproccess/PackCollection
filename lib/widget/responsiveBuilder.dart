import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pack_collection/widget/address_text_box.dart';

class responsiveBuilder extends StatelessWidget {
  const responsiveBuilder({
    this.scaffoldKey,
    this.drawer,
    this.endDrawer,
    this.title,
    this.body,
    this.trailing,
    this.floatingActionButton,
    this.menuIcon,
    this.endIcon,
    this.kTabletBreakpoint = 720.0,
    this.kDesktopBreakpoint = 1440.0,
    this.appBarElevation,
  });

  final Widget drawer, endDrawer;

  final Widget title;

  final Widget body;

  final Widget trailing;

  final Widget floatingActionButton;

  final kTabletBreakpoint;
  final kDesktopBreakpoint;
  final _drawerWidth = 304.0;

  final IconData menuIcon, endIcon;

  final double appBarElevation;

  final Key scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth >= kDesktopBreakpoint) {
          return Material(
            child: Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    if (drawer != null) ...[
                      SizedBox(
                        width: _drawerWidth,
                        child: Drawer(
                          child: SafeArea(
                            child: drawer,
                          ),
                        ),
                      ),
                    ],
                    Expanded(
                      child: Scaffold(
                        key: scaffoldKey,
                        body: Row(
                          children: <Widget>[
                            Expanded(
                              child: body ?? Container(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (floatingActionButton != null) ...[
                  Positioned(
                    top: 100.0,
                    left: _drawerWidth - 30,
                    child: floatingActionButton,
                  )
                ],
              ],
            ),
          );
        }
        if (constraints.maxWidth >= kTabletBreakpoint) {
          return Material(
            child: Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    if (drawer != null) ...[
                      SizedBox(
                        width: _drawerWidth,
                        child: Drawer(
                          child: SafeArea(
                            child: drawer,
                          ),
                        ),
                      ),
                    ],
                    Expanded(
                      child: Scaffold(
                        key: scaffoldKey,
                        body: Column(
                          children: <Widget>[

                            Expanded(
                              child: body ?? Container(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (floatingActionButton != null) ...[
                  Positioned(
                    top: 100.0,
                    left: _drawerWidth - 30,
                    child: floatingActionButton,
                  )
                ],
              ],
            ),
          );
        }
        return Scaffold(
          key: scaffoldKey,
          drawer: drawer == null
              ? null
              : Drawer(
            child: SafeArea(
              child: drawer,
            ),
          ),
          endDrawer: endDrawer == null
              ? null
              : Drawer(
            child: SafeArea(
              child: endDrawer,
            ),
          ),

          body: Column(
            children: [
              Row(
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      child: _MenuButton(iconData: Icons.list),
                      onTap: () {},
                    ),
                  ),
                  Expanded(child: addressBox()),
                ],
              ),
              Expanded(child: body),
            ],
          ),
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
      },
    );
  }
}

class _OptionsButton extends StatelessWidget {
  const _OptionsButton({
    Key key,
    @required this.iconData,
  }) : super(key: key);

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(iconData ?? Icons.more_vert),
      onPressed: () {
        Scaffold.of(context).openEndDrawer();
      },
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({
    Key key,
    @required this.iconData,
  }) : super(key: key);

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(iconData ?? Icons.menu),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}