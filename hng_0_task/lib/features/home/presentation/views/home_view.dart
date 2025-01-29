import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hng_0_task/features/features.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  Future<void> launchURL(String url, BuildContext context) async {
    final uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      log("Could not launch $url: $e");
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(urlErrorSnackBar);
      }
    }
  }

  final urlErrorSnackBar = const SnackBar(
    content: Text('Uh oh! Could not launch that url'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HNG Links'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Button(
              onTap: () async => await launchURL(
                  'https://github.com/emeleonufavour/hng_mobile_tasks/tree/main/hng_0_task',
                  context),
              text: 'View GitHub Repository',
            ),
            Button(
              onTap: () => launchURL(
                  'https://www.notion.so/Stage-0-Blog-Post-with-Strategic-Backlinks-for-HNG-Hire-Delve-and-Telex-80a6ed3d3c3d49489769d78b6a23ecda?pvs=21',
                  context),
              text: 'Flutter Developers',
            ),
            Button(
              onTap: () => launchURL(
                  'http://hng.tech/hire/mobile-ui-ux-developers', context),
              text: 'Mobile Developers',
            ),
            Button(
              onTap: () => launchURL('https://telex.im/', context),
              text: 'Go to Telex',
            ),
            Button(
              onTap: () => launchURL('https://delve.fun/', context),
              text: 'Go to Delve',
            ),
          ],
        ),
      ),
    );
  }
}
