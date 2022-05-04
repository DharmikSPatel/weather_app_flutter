import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather App 2.0",
      home: const WeatherAppRoute(),
      // theme: ThemeData(
      //   textTheme: TextTheme(
      //     titleLarge:
      //         TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      //     titleMedium:
      //         TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      //   ),
      // ),
    );
  }
}

class WeatherAppRoute extends StatefulWidget {
  const WeatherAppRoute({Key? key}) : super(key: key);

  @override
  State<WeatherAppRoute> createState() => _WeatherAppRouteState();
}

class _WeatherAppRouteState extends State<WeatherAppRoute> {
  final zipCodeInputController = TextEditingController();
  final defTextStyle = TextStyle(color: Colors.white);
  @override
  void dispose() {
    zipCodeInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Text('input'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: TextField(
                            controller: zipCodeInputController,
                            style: defTextStyle,
                            decoration: InputDecoration(
                              isDense: false,
                              contentPadding: EdgeInsets.only(left: 20),
                              hintText: 'Enter Zip Code',
                              hintStyle: defTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(31, 255, 255, 255),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        flex: 3,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                print(zipCodeInputController.text);
                              },
                              child: Text("Go",
                                  style: defTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                  )),
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromARGB(31, 255, 255, 255)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          side: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ))))),
                        ),
                      )
                    ],
                  ),

                  // Text('weather main + icon'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '45°',
                        style: defTextStyle.copyWith(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                      Image.asset("images/d11.png")
                    ],
                  ),
                  Text(
                    'Cloudy Partly',
                    style: defTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                  Text(
                    '03/05/2022',
                    style: defTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('weather data'),
                  Text('quote'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
