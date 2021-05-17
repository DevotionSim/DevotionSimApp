import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/Screens/Login/components/background.dart';
import 'package:flutter_app_devotion_sim/Screens/Signup/signup_screen.dart';
import 'package:flutter_app_devotion_sim/components/already_have_an_account_acheck.dart';
import 'package:flutter_app_devotion_sim/components/rounded_button.dart';
import 'package:flutter_app_devotion_sim/components/rounded_input_field.dart';
import 'package:flutter_app_devotion_sim/components/rounded_password_field.dart';
import 'package:flutter_app_devotion_sim/constants.dart';
import 'package:flutter_app_devotion_sim/homepage_screen.dart';
import 'package:flutter_svg/svg.dart';


class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor, fontSize: 30.0),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/dswhite.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Homepage();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}