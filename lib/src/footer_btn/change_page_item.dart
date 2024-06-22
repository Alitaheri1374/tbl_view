import 'package:flutter/material.dart';

class ChangePageWidget extends StatelessWidget {
  final Function()onTap;
  final String title;
  final bool isActive;
  const ChangePageWidget({super.key,
    required this.onTap,
    required this.title,
    this.isActive=false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        child: SizedBox(
            width: isActive?45:30,
            height: isActive?45:30,
            child: Center(
                // child: Text((title).toString())
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return SlideTransition(
                      position: Tween<Offset>(
                          begin: const Offset(0.0, -0.85),
                          end: const Offset(0.0, 0.0))
                          .animate(animation),
                      child: child,
                    );
                  },
                  child: Text(
                    title,
                    key: ValueKey<String>(title),
                    style: const TextStyle(fontSize: 20 ,color: Colors.black),
                )
            )
            )),
      ),
    );
  }
}
