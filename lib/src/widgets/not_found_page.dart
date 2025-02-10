import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nit_router/src/navigation_zones/navigation_zone_route.dart';

class NotFoundPageWidget extends StatefulWidget {
  const NotFoundPageWidget({
    super.key,
    required this.redirectRoute,
    this.infoWidget = const Text('Страница не найдена'),
    this.showCounter = true,
    this.showRedirectButton = true,
  });

  final Widget infoWidget;
  final NavigationZoneRoute redirectRoute;
  final bool showCounter;
  final bool showRedirectButton;

  @override
  State<NotFoundPageWidget> createState() => _NotFoundPageWidgetState();
}

class _NotFoundPageWidgetState extends State<NotFoundPageWidget> {
  Timer? timer;
  int counter = -1;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timer = Timer(
      const Duration(seconds: 1),
      () {
        if (counter == -1) {
          setState(() {
            counter = 3;
          });
        } else if (counter > 0) {
          setState(() {
            counter--;
          });
        } else if (counter == 0) {
          context.goNamed(widget.redirectRoute.name);
        }
      },
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.infoWidget,
            if (widget.showCounter && counter != -1) Text('$counter'),
            if (widget.showRedirectButton)
              IconButton(
                onPressed: () {
                  context.goNamed(widget.redirectRoute.name);
                },
                icon: const Icon(Icons.reply),
              ),
          ],
        ),
      ),
    );
  }
}
