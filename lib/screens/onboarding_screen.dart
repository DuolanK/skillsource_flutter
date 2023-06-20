import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

import '../widgets/animated_button.dart';
import '../widgets/custom_login.dart';
import '../widgets/login_form.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isLoginDialogShown = false;
  late RiveAnimationController _btnAnimationController;
  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active", autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RiveAnimation.asset(
            "lib/assets/RiveAssets/shapes.riv",
            fit: BoxFit.fitWidth,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(),
            ),
          ),
          AnimatedPositioned(
            top: isLoginDialogShown ? -50 : 0,
            duration: Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  SizedBox(
                    width: 260,
                    child: Column(
                      children: [
                        Text(
                          "Наши решения - ваш успех",
                          style: TextStyle(
                              fontSize: 50,
                              height: 1,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                            "Наши инновационные решения - это ваш путь к более высоким заработкам и лучшему качеству жизни")
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  AnimatedBtn(
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        _btnAnimationController.isActive = true;
                        Future.delayed(Duration(milliseconds: 600), () {
                          setState(() {
                            isLoginDialogShown = true;
                          });
                          CustomLoginDialog(context, onClosed: (_) {
                            setState(() {
                              isLoginDialogShown = false;
                            });
                          });
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                        "Получите доступ к более чем 100 лекциям, 40 видео и 240 интерактивным заданиям, которые помогут вам достичь высот в профессиональной жизни."),
                  )
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
