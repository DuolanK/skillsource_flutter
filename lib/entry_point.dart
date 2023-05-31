import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:skillsource/utils/rive_utils.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  late SMIBool searchTrigger;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SafeArea(
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 103, 255).withOpacity(0.8),
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                searchTrigger.change(true);
              },
              child: SizedBox(
                height: 36,
                width: 36,
                child: RiveAnimation.asset("lib/assets/RiveAssets/icons.riv",
                    artboard: "SEARCH", onInit: (artboard) {
                  StateMachineController controller =
                      RiveUtils.getRiveController(artboard,
                          stateMachineName: "SEARCH_Interactivity");
                  searchTrigger = controller.findSMI("active") as SMIBool;
                }),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class RiveAsset {
  final String artboard, stateMachineName, title;
  late SMIBool? input;

  RiveAsset(this.artboard, this.stateMachineName, this.title, this.input);
  set setInput(SMIBool status) {
    input = status;
  }
}
