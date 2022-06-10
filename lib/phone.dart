import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'OTPcontroller.dart';

class phone extends StatefulWidget {
  @override
  State<phone> createState() => _phoneState();
}

class _phoneState extends State<phone> {
  late String cd;
  void _close() {
    Navigator.pop(context);
  }

  navigateTolang() {
    Navigator.pushReplacementNamed(context, "/langPage");
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController? _controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: GestureDetector(
                onTap: navigateTolang,
                child: Image(
                  image: AssetImage("assets/close.png"),
                  width: 14,
                  height: 14,
                ),
              ),
            ),
            Center(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 45, 5, 15),
                  child: Text(
                    "Please enter your mobile number".tr,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "You'll receive a 6 digit code".tr,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "to verify next".tr,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 24),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffeeeeee),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black.withOpacity(0.13)),
                    ),
                    child: Stack(
                      children: [
                        InternationalPhoneNumberInput(
                          textFieldController: _controller,
                          onInputChanged: (value) {
                            cd = value.toString();
                          },
                          selectorTextStyle: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          formatInput: false,
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          inputDecoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(bottom: 15, left: 0),
                              border: InputBorder.none,
                              hintText: "Mobile Number".tr,
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 16)),
                        ),
                        Positioned(
                            left: 90,
                            top: 8,
                            bottom: 8,
                            child: Container(
                              height: 40,
                              width: 1,
                              color: Colors.black.withOpacity(0.13),
                            ))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 20, 24),
                  child: FlatButton(
                    color: Color.fromARGB(255, 8, 65, 112),
                    minWidth: 350,
                    height: 55,
                    onPressed: () {
                      if (_controller.text.length == 10) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => OTPcontroller(
                                  phone: cd,
                                ))));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Please enter correct Mobile No.".tr),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "CONTINUE".tr,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
