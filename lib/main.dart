import 'dart:convert';

import 'package:diabease/diabease/presentation/pages/has_diabetes.dart';
import 'package:diabease/diabease/presentation/pages/no_diabetes.dart';
import 'package:diabease/diabease/presentation/pages/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sklite/SVM/SVM.dart';
import 'package:sklite/ensemble/forest.dart';
import 'package:sklite/utils/io.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/has-diabetes',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MyHomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/questions': (context) => const Questions(),
        '/no-diabetes': (context) => const NoDiabetes(),
        '/has-diabetes': (context) => const HasDiabetes(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late SVC svc;
  late RandomForestClassifier randomForestClassifier;

  @override
  void initState() {
    // loadModel("assets/my_model.json").then((x) {
    //   //svc = SVC.fromMap(json.decode(x));

    //   randomForestClassifier = RandomForestClassifier.fromMap(params6);
    // });
    declare();
    super.initState();
  }

  void declare() async {
    var params6 = await loadModel("assets/my_model.json");
    randomForestClassifier =
        RandomForestClassifier.fromMap(json.decode(params6));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF004aad),
      body: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'DIABEASE',
                  style: GoogleFonts.fredoka(
                    textStyle: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 40.6,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'QUICK AND \n EASY \n DIABETES \n ASSESMENT',
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  style: GoogleFonts.leagueSpartan(
                    textStyle: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 22.2,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 128,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/questions');
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 64),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'START',
                      style: GoogleFonts.leagueSpartan(
                        textStyle: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 27.4,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF004aad),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        List<double> data = [55, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1];
        final result = randomForestClassifier.predict(data);
        print(result);
      }),
    );
  }
}
