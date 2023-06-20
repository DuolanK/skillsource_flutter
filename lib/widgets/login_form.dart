import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';
import 'package:skillsourse/entry_point.dart';
import 'package:skillsourse/utils/rive_utils.dart';
import 'package:skillsourse/screens/dashboard_screen.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({Key? key}) : super(key: key);

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isShowLoading = false;
  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;
  late SMITrigger confetti;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildForm(),
        _buildConfettiAnimation(),
        if (isShowLoading) _buildLoadingAnimation(),
      ],
    );
  }

  Form _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLoginText(),
          _buildLoginField(),
          _buildPasswordText(),
          _buildPasswordField(),
          _buildLoginButton(),
          _buildForgotPasswordButton(),
        ],
      ),
    );
  }

  Text _buildLoginText() {
    return Text(
      'Login',
      style: TextStyle(color: Colors.black54),
    );
  }

  Padding _buildLoginField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 16),
      child: TextFormField(
        validator: (value) => value!.isEmpty ? "" : null,
        onSaved: (login) {},
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SvgPicture.asset("lib/assets/icons/email.svg"),
          ),
        ),
      ),
    );
  }

  Text _buildPasswordText() {
    return Text(
      'Password',
      style: TextStyle(color: Colors.black54),
    );
  }

  Padding _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 16),
      child: TextFormField(
        validator: (value) => value!.isEmpty ? "" : null,
        onSaved: (password) {},
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SvgPicture.asset("lib/assets/icons/password.svg"),
          ),
        ),
      ),
    );
  }

  Padding _buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 24),
      child: ElevatedButton.icon(
        onPressed: _onLoginButtonPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 56),
          backgroundColor: Color(0xFFF77D8E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        icon: SvgPicture.asset(
          "lib/assets/icons/Arrow_Right.svg",
          color: Colors.white,
        ),
        label: Text('Log In'),
      ),
    );
  }

  void _onLoginButtonPressed() {
    setState(() {
      isShowLoading = true;
    });
    Future.delayed(Duration(seconds: 1), () {
      if (_formKey.currentState!.validate()) {
        check.fire();

        Future.delayed(
          Duration(seconds: 2),
          () {
            setState(() {
              isShowLoading = false;
            });
            confetti.fire();
            Future.delayed(Duration(seconds: 3), () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EntryPoint(),
                  ));
            });
          },
        );
      } else {
        error.fire();
        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            isShowLoading = false;
          });
        });
      }
    });
  }

  Row _buildForgotPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            "Forgot Password?",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }

  CustomPositioned _buildLoadingAnimation() {
    return CustomPositioned(
      child: RiveAnimation.asset(
        "lib/assets/RiveAssets/check.riv",
        onInit: (artboard) {
          StateMachineController controller =
              RiveUtils.getRiveController(artboard);
          check = controller.findSMI("Check") as SMITrigger;
          error = controller.findSMI("Error") as SMITrigger;
          reset = controller.findSMI("Reset") as SMITrigger;
        },
      ),
    );
  }

  CustomPositioned _buildConfettiAnimation() {
    return CustomPositioned(
      child: Transform.scale(
        scale: 8,
        child: RiveAnimation.asset(
          "lib/assets/RiveAssets/confetti.riv",
          onInit: (artboard) {
            StateMachineController controller =
                RiveUtils.getRiveController(artboard);
            confetti = controller.findSMI("Trigger explosion") as SMITrigger;
          },
        ),
      ),
    );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({Key? key, required this.child, this.size = 100})
      : super(key: key);
  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Column(
      children: [
        Spacer(),
        SizedBox(
          width: size,
          height: size,
          child: child,
        ),
        Spacer(
          flex: 2,
        ),
      ],
    ));
  }
}
