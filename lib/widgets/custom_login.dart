import 'package:flutter/material.dart';

import 'login_form.dart';

Future<Object?> CustomLoginDialog(BuildContext context,
    {required ValueChanged onClosed}) {
  return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "Log-in",
      context: context,
      transitionDuration: Duration(milliseconds: 400),
      transitionBuilder: ((_, animation, __, child) {
        Tween<Offset> tween;
        tween = Tween(begin: Offset(0, -1), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );
      }),
      pageBuilder: (context, _, __) => Center(
            child: Container(
              height: 500,
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(children: [
                      Text(
                        'Log In',
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.w800),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          'Получите доступ к более чем 100 лекциям, 40 видео и 240 интерактивным заданиям.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      LogInForm()
                    ]),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: -40,
                      child: CircleAvatar(
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                        radius: 16,
                        backgroundColor: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )).then(onClosed);
}
