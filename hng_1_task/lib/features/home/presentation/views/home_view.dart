import 'package:flutter/material.dart';
import 'package:hng_1_task/features/features.dart';
import 'package:hng_1_task/utils/utils.dart';

final pages = [
  PageData(
    type: PageType.encrypt,
    title: "Hide a message",
    bgColor: const Color(0xFF0043D0),
    textColor: Colors.white,
    textFocus: FocusNode(),
    passwordFocus: FocusNode(),
    textCtr: TextEditingController(),
    passwordCtr: TextEditingController(),
  ),
  PageData(
    type: PageType.decrypt,
    title: "Let's reveal that secret",
    textColor: Colors.white,
    bgColor: const Color(0xFFE69500),
    textFocus: FocusNode(),
    passwordFocus: FocusNode(),
    textCtr: TextEditingController(),
    passwordCtr: TextEditingController(),
  ),
];

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final PageViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = PageViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageProvider<PageViewModel>(
      viewModel: _viewModel,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: ConcentricPageView(
              itemBuilder: (index) {
                final page = pages[index % pages.length];
                return ValueListenableBuilder(
                  valueListenable: _viewModel,
                  builder: (context, _, __) => SafeArea(
                      child: PageContent(
                    page: page,
                    key: ValueKey(page.type),
                  )),
                );
              },
              colors: pages.map((p) => p.bgColor).toList()),
        ),
      ),
    );
  }
}
