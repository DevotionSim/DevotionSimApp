import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/Screens/Login/login_screen.dart';
import 'package:flutter_app_devotion_sim/Screens/Signup/components/background.dart';
import 'package:flutter_app_devotion_sim/Screens/Signup/signup_screen.dart';
import 'package:flutter_app_devotion_sim/components/rounded_button.dart';
import 'package:flutter_app_devotion_sim/constants.dart';
import 'package:flutter_svg/svg.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/dswhite.svg",
              height: size.height * 0.40,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
