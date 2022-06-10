import 'package:flutter/material.dart';
import 'package:get/get.dart';

class language_selection extends StatefulWidget {
  const language_selection({Key? key}) : super(key: key);

  @override
  State<language_selection> createState() => _language_selectionState();
}

class _language_selectionState extends State<language_selection> {
  navigateTophone() {
    Navigator.pushReplacementNamed(context, "/phonePage");
  }

  String langChoose = "English";

  // final List locale = [
  //   {'name': 'English', 'locale': Locale('en', 'US')},
  //   {'name': 'हिन्दी', 'locale': Locale('hi', 'IN')},
  // ];
  List langselect = ["English", "हिन्दी"];

  void l() {
    if (langChoose == "English") {
      var locale = Locale('en', 'US');
      Get.updateLocale(locale);
    } else {
      var locale = Locale('hi', 'IN');
      Get.updateLocale(locale);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 130.0,
            ),
            Image(
              image: AssetImage("assets/imageicon.png"),
              height: 50.0,
              width: 50.0,
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              "Please select your Language".tr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "You can change the language".tr,
              style: TextStyle(
                fontSize: 13.0,
              ),
            ),
            Text(
              "any time.".tr,
              style: TextStyle(
                fontSize: 13.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25),
              child: Container(
                height: 50,
                width: 230,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: DropdownButton(
                    hint: Text("Select Items : "),
                    underline: SizedBox(),
                    icon: Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    value: langChoose,
                    onChanged: (newValue) {
                      setState(
                        () {
                          langChoose = newValue.toString();
                          l();
                        },
                      );
                    },
                    items: langselect.map(
                      (valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
            FlatButton(
              color: Color.fromARGB(255, 8, 65, 112),
              minWidth: 230,
              height: 50,
              onPressed: () {
                navigateTophone();
              },
              child: Text(
                "NEXT".tr,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            Image(
              image: AssetImage("assets/bottom_design.png"),
              width: 500, height: 100,
              //     ),
              //   ),
              // ],
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
