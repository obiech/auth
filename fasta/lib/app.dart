import 'package:fasta/splash/splash_view.dart';
import 'package:fasta/theming/size_config.dart';
import 'package:flutter/material.dart';

class Fasta extends StatelessWidget {
  const Fasta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fasta',
        debugShowCheckedModeBanner: false,
        routes: {Splash.route: (_) => const Splash()},
        home: const Responsive(child: Splash()));
  }
}
