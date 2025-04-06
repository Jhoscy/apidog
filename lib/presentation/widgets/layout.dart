import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  Layout({super.key, required this.appBar, required this.body, required this.scaffoldKey});

  final AppBar appBar;
  final Widget body;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
