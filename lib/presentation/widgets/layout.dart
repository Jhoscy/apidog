import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({super.key, required this.appBar, required this.body});

  final AppBar appBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.surface,
                Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5),
              ]),
        ),
        child: SafeArea(
          child: body,
        ),
      ),
    );
  }
}
