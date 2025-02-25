import 'package:flutter/material.dart';
import 'package:hng_2_task/core/core.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    super.key,
    this.drawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
    required this.body,
    this.appBar,
    required this.useSingleScroll,
    this.bg,
    this.scaffoldKey,
    this.controller,
    this.scrollPhysics,
    this.safeAreaTop,
    this.extendBody,
    this.statusBarColor,
    this.navBarColor,
    this.isLight = false,
    this.padding,
    this.resizeToAvoidInsets,
    this.floatingActionButtonLocation,
  });

  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Widget body;
  final EdgeInsets? padding;
  final PreferredSizeWidget? appBar;
  final bool useSingleScroll;
  final bool? resizeToAvoidInsets;
  final Color? bg;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final ScrollController? controller;
  final ScrollPhysics? scrollPhysics;
  final bool? safeAreaTop;
  final bool? extendBody;
  final Color? statusBarColor;
  final Color? navBarColor;
  final bool? isLight;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        drawerEnableOpenDragGesture: true,
        key: scaffoldKey,
        appBar: appBar,
        resizeToAvoidBottomInset: resizeToAvoidInsets,
        body: SafeArea(
          top: safeAreaTop ?? true,
          bottom: false,
          child: useSingleScroll
              ? SingleChildScrollView(
                  controller: controller,
                  physics: scrollPhysics,
                  child: Padding(
                    padding: padding ??
                        const EdgeInsets.fromLTRB(
                          FontSize.kfsExtraLarge,
                          FontSize.kXtremeLarge,
                          FontSize.kfsExtraLarge,
                          0,
                        ),
                    child: body,
                  ),
                )
              : Padding(
                  padding: padding ??
                      const EdgeInsets.fromLTRB(
                        FontSize.kfsExtraLarge,
                        FontSize.kXtremeLarge,
                        FontSize.kfsExtraLarge,
                        0,
                      ),
                  child: body,
                ),
        ),
        drawer: drawer,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
      ),
    );
  }
}
