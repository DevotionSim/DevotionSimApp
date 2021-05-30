import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/Screens/Dashboard/dashboard_screen.dart';
import 'package:flutter_app_devotion_sim/Screens/Login/components/background.dart';
import 'package:flutter_app_devotion_sim/classes/costumer.dart';
import 'package:flutter_app_devotion_sim/classes/qr_code.dart';
import 'package:flutter_app_devotion_sim/classes/qr_list.dart';
import 'package:flutter_app_devotion_sim/classes/stats_list.dart';
import 'package:flutter_app_devotion_sim/components/already_have_an_account_acheck.dart';
import 'package:flutter_app_devotion_sim/components/rounded_button.dart';
import 'package:flutter_app_devotion_sim/components/rounded_input_field.dart';
import 'package:flutter_app_devotion_sim/components/rounded_password_field.dart';
import 'package:flutter_app_devotion_sim/constants.dart';
import 'package:flutter_svg/svg.dart';

import '../login_screen.dart';

class Body extends State<LoginScreen> {

  late Map<int, QRCode> _mapQR;
  late QRList _qrList;
  late StatsList _statsList;

  @override
  void initState() {
    super.initState();
    _mapQR = Map<int, QRCode>();
    _qrList = QRList();
    _statsList = StatsList.onlyTrack('mugello');
    for(int i = 0; i < 15; i++) {
      QRCode code = QRCode('qr' + i.toString());
      code.setStatsList(_statsList);
      _mapQR[i] = code;
    }
   _qrList.setQRList(_mapQR); 
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(
                  fontFamily: 'MotoGP',
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                  fontSize: 30.0
                ),
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
                        return DashboardScreen(new Costumer(0, 'example', 'example@example.net', _qrList));
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
      ),
    );
  }
}
