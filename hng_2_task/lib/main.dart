import 'package:flutter/material.dart';
import 'lib.dart';

void main() async {
  Setup.run();
  final providers = await CountryProviders.createProviders();
  runApp(CountryApp(
    providers: providers,
  ));
}
