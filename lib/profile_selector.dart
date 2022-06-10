import 'package:flutter/material.dart';
import 'package:get/get.dart';

class profile_selector extends StatefulWidget {
  @override
  State<profile_selector> createState() => _profile_selectorState();
}

class _profile_selectorState extends State<profile_selector> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 120,
              ),
              Text(
                "Please select your profile".tr,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 23),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(21, 25, 21, 10),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.zero),
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value as int;
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(1, 10, 10, 10),
                        child: Image(
                          image: AssetImage("assets/shipper.png"),
                          height: 55,
                          width: 55,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Shipper".tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 21,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet,",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          Text("consectetur adipiscing",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(21, 10, 21, 23),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.zero),
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value as int;
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(1, 10, 10, 10),
                        child: Image(
                          image: AssetImage("assets/transporter.png"),
                          height: 55,
                          width: 55,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Transporter".tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 21,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet,",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          Text("consectetur adipiscing",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              )),
                        ],
                      ),
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
                  onPressed: () {},
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
          ),
        ),
        // ],
      ),
    );
    //   ),
    // );
  }
}
