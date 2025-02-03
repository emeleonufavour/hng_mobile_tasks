import 'package:flutter/material.dart';
import 'package:hng_1_task/features/features.dart';
import 'package:hng_1_task/utils/utils.dart';

class PageContent extends StatelessWidget {
  final PageData page;

  const PageContent({required this.page, super.key});

  void _showSnackBar(BuildContext context, String message,
      {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final viewModel = PageProvider.of<PageViewModel>(context);

    space(double p) => SizedBox(height: screenHeight * p / 100);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          space(10),
          Text(
            page.title ?? "",
            style: TextStyle(
                fontSize: screenHeight * 0.04,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          space(3),
          PageTextField(
              message: "Enter your text here",
              controller: page.textCtr,
              focusNode: page.textFocus,
              onSubmitted: (s) => page.passwordFocus.requestFocus(),
              pageType: page.type),
          space(5),
          PageTextField(
              message: "What is the password?",
              controller: page.passwordCtr,
              focusNode: page.passwordFocus,
              pageType: page.type),
          space(5),
          PageResult(
            viewModel: viewModel,
            type: page.type,
            showSnackBar: (context, message) {
              _showSnackBar(context, message);
            },
          ),
          space(8),
          if (viewModel.isLoading)
            const CircularProgressIndicator.adaptive()
          else
            Button(
              textColor: page.bgColor,
              color: Colors.white,
              onTap: () async {
                try {
                  if (page.textCtr.text.isEmpty ||
                      page.passwordCtr.text.isEmpty) {
                    _showSnackBar(context, "Something is missing!",
                        isError: true);
                    return;
                  }
                  await viewModel.performAction(
                      page.type, page.textCtr.text, page.passwordCtr.text);

                  if (context.mounted) {
                    _showSnackBar(
                      context,
                      page.type == PageType.encrypt
                          ? "Text encrypted successfully!"
                          : "Text decrypted successfully!",
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    _showSnackBar(context, "Uh oh! Could not decrypt that",
                        isError: true);
                  }
                }
              },
              text: page.type == PageType.encrypt ? "Encrypt" : "Decrypt",
            )
        ],
      ),
    );
  }
}
