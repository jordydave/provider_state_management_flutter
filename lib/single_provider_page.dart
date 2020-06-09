import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas11/application_color.dart';

class SingleProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<ApplicationColor>(
        create: (context) => ApplicationColor(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Row(
              children: <Widget>[
                Consumer<ApplicationColor>(
                  builder: (context, applicationColor, _) => Icon(
                    Icons.color_lens,
                    color: applicationColor.color,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Consumer<ApplicationColor>(
                  builder: (context, applicationColor, _) => Text(
                    "Jordy",
                    style: TextStyle(
                      color: applicationColor.color,
                    ),
                  ),
                ),
                Consumer<ApplicationColor>(
                  builder: (context, applicationColor, _) => Text(
                    "Dave",
                    style: TextStyle(
                      color: applicationColor.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<ApplicationColor>(
                  builder: (context, applicationColor, _) => AnimatedContainer(
                    margin: EdgeInsets.all(10),
                    height: 200,
                    width: 200,
                    duration: Duration(
                      milliseconds: 500,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: applicationColor.color,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(1, 2),
                          blurRadius: 10,
                          color: Colors.purple[300],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Consumer<ApplicationColor>(
                      builder: (context, applicationColor, _) => Text(
                        "AB",
                        style: TextStyle(color: applicationColor.color),
                      ),
                    ),
                    Consumer<ApplicationColor>(
                      builder: (context, applicationColor, _) => Switch(
                        activeColor: applicationColor.color,
                        hoverColor: applicationColor.color,
                        value: applicationColor.isLightBlue,
                        onChanged: (newValue) {
                          applicationColor.isLightBlue = newValue;
                        },
                      ),
                    ),
                    Consumer<ApplicationColor>(
                      builder: (context, applicationColor, _) => Text(
                        "LB",
                        style: TextStyle(color: applicationColor.color),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
