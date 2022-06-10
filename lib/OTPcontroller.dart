import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_phone_auth/profile_selector.dart';

import 'package:pinput/pin_put/pin_put.dart';

class OTPcontroller extends StatefulWidget {
  final String phone;
  OTPcontroller({required this.phone});
  @override
  State<OTPcontroller> createState() => _OTPcontrollerState();
}

class _OTPcontrollerState extends State<OTPcontroller> {
  final TextEditingController _pinOTPCodeController = TextEditingController();
  final FocusNode _pinOTPCodeFocus = FocusNode();
  String? verificationCode;
  late String pinpin;
  bool pressed = true;
  bool load = false;

  final BoxDecoration pinOTPCodeDecoratoin = BoxDecoration(
    color: Color.fromARGB(255, 123, 202, 238),
    borderRadius: BorderRadius.circular(2.0),
  );
  final BoxDecoration pinOTPCodeDecoratoin2 = BoxDecoration(
    color: Colors.green,
    borderRadius: BorderRadius.circular(2.0),
  );
  final BoxDecoration pinOTPCodeDecoratoin3 = BoxDecoration(
    color: Colors.yellow,
    borderRadius: BorderRadius.circular(2.0),
  );

  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }

  void _printLatestValue() {
    print(pinpin);
  }

  int? _resendToken;

  verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "${widget.phone}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) {
          if (value.user != null) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (c) => profile_selector()));
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message.toString()),
            duration: Duration(seconds: 3),
          ),
        );
      },
      codeSent: (String vID, int? resentToken) {
        setState(() {
          verificationCode = vID;
          _resendToken = resentToken;
        });
      },
      forceResendingToken: _resendToken,
      codeAutoRetrievalTimeout: (String vID) {
        setState(() {
          verificationCode = vID;
        });
      },
      timeout: Duration(seconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: load
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Verify Phone".tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {},
                      child:
                          Text("Code is sent to ".tr + " " + "${widget.phone}"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: PinPut(
                    fieldsCount: 6,
                    textStyle: TextStyle(fontSize: 25, color: Colors.white),
                    eachFieldWidth: 48,
                    eachFieldHeight: 55,
                    focusNode: _pinOTPCodeFocus,
                    controller: _pinOTPCodeController,
                    submittedFieldDecoration: pinOTPCodeDecoratoin3,
                    selectedFieldDecoration: pinOTPCodeDecoratoin2,
                    followingFieldDecoration: pinOTPCodeDecoratoin,
                    pinAnimationType: PinAnimationType.rotation,
                    onSubmit: (pin) async {
                      pinpin = pin;
                      _pinOTPCodeController.addListener(_printLatestValue);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive the code? ".tr,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    GestureDetector(
                      onTap: (() {
                        pressed ? verifyPhoneNumber() : null;
                        setState(() {
                          pressed = !pressed;
                        });
                        Timer(Duration(seconds: 5),
                            () => setState(() => pressed = true));
                        // btnctrl();
                      }),
                      child: Text(
                        "Request Again".tr,
                        style: pressed
                            ? TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)
                            : TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 25, 30, 24),
                  child: FlatButton(
                    color: Color.fromARGB(255, 8, 65, 112),
                    minWidth: 350,
                    height: 55,
                    onPressed: () {
                      setState(() {
                        load = true;
                      });
                      try {
                        FirebaseAuth.instance
                            .signInWithCredential(PhoneAuthProvider.credential(
                                verificationId: verificationCode!,
                                smsCode: pinpin))
                            .then((value) {
                          if (value.user != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(pinpin),
                                duration: Duration(seconds: 3),
                              ),
                            );
                            var duration = const Duration(seconds: 5);
                            sleep(duration);
                            setState(() {
                              load = false;
                            });
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (c) => profile_selector()));
                          }
                        });
                      } catch (e) {
                        FocusScope.of(context).unfocus();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Invalid OTP".tr),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "VERIFY AND CONTINUE".tr,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

// FocusNode :-
/*
=> An object that can be used by a stateful widget to obtain the keyboard focus and to handle keyboard events.
*/

// ScaffoldState :-
/*
=> State for a [Scaffold].
=> Can display [BottomSheet]s. Retrieve a [ScaffoldState] from the current [BuildContext] using [Scaffold.of].
*/

// FocusScope.of(context).unfocus() :-
/*
=> Removes the focus on this node by moving the primary focus to another node.
=> This method removes focus from a node that has the primary focus, cancels any outstanding requests
   to focus it, while setting the primary focus to another node according to the disposition.
*/