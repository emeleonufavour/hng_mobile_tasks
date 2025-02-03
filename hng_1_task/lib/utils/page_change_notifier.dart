import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageChangeNotifier extends ChangeNotifier
    implements ValueListenable<PageChangeNotifier> {
  @protected
  void notifyChanges() {
    notifyListeners();
  }

  @override
  PageChangeNotifier get value => this;
}

class PageProvider<T extends PageChangeNotifier> extends StatefulWidget {
  final Widget child;
  final T viewModel;

  const PageProvider({
    required this.child,
    required this.viewModel,
    super.key,
  });

  static T of<T extends PageChangeNotifier>(BuildContext context,
      {bool listen = true}) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<_InheritedProvider<T>>()!
          .viewModel;
    }
    return context.findAncestorWidgetOfExactType<PageProvider<T>>()!.viewModel;
  }

  @override
  State<PageProvider<T>> createState() => _PageProviderState<T>();
}

class _PageProviderState<T extends PageChangeNotifier>
    extends State<PageProvider<T>> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(_onViewModelChanged);
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_onViewModelChanged);
    super.dispose();
  }

  void _onViewModelChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedProvider(
      viewModel: widget.viewModel,
      child: widget.child,
    );
  }
}

class _InheritedProvider<T extends PageChangeNotifier> extends InheritedWidget {
  final T viewModel;

  const _InheritedProvider({
    required this.viewModel,
    required super.child,
    super.key,
  });

  @override
  bool updateShouldNotify(_InheritedProvider<T> oldWidget) => true;
}
