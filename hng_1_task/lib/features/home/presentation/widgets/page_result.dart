import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng_1_task/features/features.dart';

class PageResult extends StatelessWidget {
  final PageViewModel viewModel;
  final PageType type;
  final void Function(BuildContext, String)? showSnackBar;
  const PageResult(
      {required this.viewModel,
      required this.type,
      this.showSnackBar,
      super.key});

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    if (showSnackBar != null) {
      showSnackBar!(context, 'Copied to clipboard!');
    }
  }

  @override
  Widget build(BuildContext context) {
    final result = type == PageType.encrypt
        ? viewModel.encryptedData
        : viewModel.decryptedData;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                type == PageType.encrypt
                    ? 'Encrypted Text:'
                    : 'Decrypted Text:',
                style: const TextStyle(color: Colors.white70),
              ),
              IconButton(
                icon: const Icon(Icons.copy, color: Colors.white70),
                onPressed: () =>
                    result.isEmpty ? null : _copyToClipboard(context, result),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            result.isEmpty ? "Your text will appear here!" : result,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
