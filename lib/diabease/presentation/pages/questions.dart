import 'dart:convert';

import 'package:diabease/diabease/presentation/bloc/diabease_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sklite/ensemble/forest.dart';
import 'package:sklite/utils/io.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final ageTextController = TextEditingController(text: '0');
  bool isMale = false;
  int obesity = 0,
      polyuria = 0,
      polydipsia = 0,
      suddenWeightLoss = 0,
      weakness = 0,
      polyphagia = 0,
      genitalThrush = 0,
      visualBlurring = 0,
      itching = 0,
      irritability = 0,
      delayedHealing = 0,
      partialParesis = 0,
      muscleStiffness = 0,
      alopecia = 0;
  final questions = [
    'Obesity: Do you have obesity?',
    'Polyuria: Do you experience excessive urination?',
    'Polydipsia: Do you experience excessive thirst?',
    'Sudden Weight Loss: Have you experienced sudden weight loss recently?',
    'Weakness: Do you experience weakness or fatigue?',
    'Polyphagia: Do you experience excessive hunger or increased appetite?',
    'Genital Thrush: Do you have genital thrush (yeast infection)?',
    'Visual Blurring: Do you experience blurred vision?',
    'Itching: Do you experience itching?',
    'Irritability: Do you experience irritability?',
    'Delayed Healing: Do you experience delayed healing of wounds?',
    'Partial Paresis: Do you have partial paralysis or weakness of limbs?',
    'Muscle Stiffness: Do you experience muscle stiffness?',
    'Alopecia: Do you experience hair loss especially in the extremities (e.g., arms, legs)?'
  ];
  final pageViewController = PageController();

  int currentPageIndex = 0;

  late RandomForestClassifier randomForestClassifier;

  @override
  void initState() {
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
      appBar: AppBar(
        backgroundColor: const Color(0xFF004aad),
        leading: const SizedBox(),
      ),
      backgroundColor: const Color(0xFF004aad),
      body: BlocProvider(
        create: (context) => DiabeaseBloc(),
        child: BlocConsumer<DiabeaseBloc, DiabeaseState>(
          listener: (context, state) {
            if (state is DiabeaseSuccessState) {
              if (state.result == 0) {
                Navigator.pushNamed(context, '/no-diabetes');
              } else {
                Navigator.pushNamed(context, '/has-diabetes');
              }
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: pageViewController,
                    onPageChanged: (int index) {
                      setState(() {
                        currentPageIndex = index;
                      });
                    },
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 12),
                            child: Row(
                              children: [
                                Text(
                                  'Age: Enter your age in years. ',
                                  style: GoogleFonts.leagueSpartan(
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 50,
                                  child: TextFormField(
                                    controller: ageTextController,
                                    cursorColor: Colors.white,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Gender: Select your gender. ',
                                  style: GoogleFonts.leagueSpartan(
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 5,
                                  children: [
                                    Radio.adaptive(
                                      value: false,
                                      groupValue: isMale,
                                      onChanged: (value) {
                                        setState(() {
                                          isMale = false;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Female',
                                      style: GoogleFonts.leagueSpartan(
                                        textStyle: const TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 5,
                                  children: [
                                    Radio.adaptive(
                                      value: true,
                                      groupValue: isMale,
                                      onChanged: (value) {
                                        setState(() {
                                          isMale = true;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Male',
                                      style: GoogleFonts.leagueSpartan(
                                        textStyle: const TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          //obesity
                          Question(
                            title: questions[0],
                            groupValue: obesity,
                            callback: (value) {
                              setState(() {
                                obesity = value;
                              });
                            },
                          ),
                          Spacer(),
                          //polyuria
                          Question(
                            title: questions[1],
                            groupValue: polyuria,
                            callback: (value) {
                              setState(() {
                                polyuria = value;
                              });
                            },
                          ),
                          Spacer(),
                          //polydipsia
                          Question(
                            title: questions[2],
                            groupValue: polydipsia,
                            callback: (value) {
                              setState(() {
                                polydipsia = value;
                              });
                            },
                          ),
                          Spacer(
                            flex: 5,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //sudden weight loss
                          Question(
                            title: questions[3],
                            groupValue: suddenWeightLoss,
                            callback: (value) {
                              setState(() {
                                suddenWeightLoss = value;
                              });
                            },
                          ),
                          Spacer(),
                          //weakness
                          Question(
                            title: questions[4],
                            groupValue: weakness,
                            callback: (value) {
                              setState(() {
                                weakness = value;
                              });
                            },
                          ),
                          Spacer(),
                          //polyphagia
                          Question(
                            title: questions[5],
                            groupValue: polyphagia,
                            callback: (value) {
                              setState(() {
                                polyphagia = value;
                              });
                            },
                          ),
                          Spacer(),
                          //genital thrush
                          Question(
                            title: questions[6],
                            groupValue: genitalThrush,
                            callback: (value) {
                              setState(() {
                                genitalThrush = value;
                              });
                            },
                          ),
                          Spacer(
                            flex: 5,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //visual blurring
                          Question(
                            title: questions[7],
                            groupValue: visualBlurring,
                            callback: (value) {
                              setState(() {
                                visualBlurring = value;
                              });
                            },
                          ),
                          Spacer(),
                          //itching
                          Question(
                            title: questions[8],
                            groupValue: itching,
                            callback: (value) {
                              setState(() {
                                itching = value;
                              });
                            },
                          ),
                          Spacer(),
                          //irritability
                          Question(
                            title: questions[9],
                            groupValue: irritability,
                            callback: (value) {
                              setState(() {
                                irritability = value;
                              });
                            },
                          ),
                          Spacer(),
                          //delayed healing
                          Question(
                            title: questions[10],
                            groupValue: delayedHealing,
                            callback: (value) {
                              setState(() {
                                delayedHealing = value;
                              });
                            },
                          ),
                          Spacer(
                            flex: 5,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //partial paresis
                          Question(
                            title: questions[11],
                            groupValue: partialParesis,
                            callback: (value) {
                              setState(() {
                                partialParesis = value;
                              });
                            },
                          ),
                          Spacer(),
                          //muscle stiffness
                          Question(
                            title: questions[12],
                            groupValue: muscleStiffness,
                            callback: (value) {
                              setState(() {
                                muscleStiffness = value;
                              });
                            },
                          ),
                          Spacer(),
                          //alopecia
                          Question(
                            title: questions[13],
                            groupValue: alopecia,
                            callback: (value) {
                              setState(() {
                                alopecia = value;
                              });
                            },
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              BlocProvider.of<DiabeaseBloc>(context).add(
                                AnalyzeEvent(
                                  data: [
                                    double.parse(ageTextController.text),
                                    isMale ? 1 : 0,
                                    obesity.toDouble(),
                                    polyuria.toDouble(),
                                    polydipsia.toDouble(),
                                    suddenWeightLoss.toDouble(),
                                    weakness.toDouble(),
                                    polyphagia.toDouble(),
                                    genitalThrush.toDouble(),
                                    visualBlurring.toDouble(),
                                    itching.toDouble(),
                                    irritability.toDouble(),
                                    delayedHealing.toDouble(),
                                    partialParesis.toDouble(),
                                    muscleStiffness.toDouble(),
                                    alopecia.toDouble()
                                  ],
                                  randomForestClassifier:
                                      randomForestClassifier,
                                ),
                              );
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/images/analyze.png',
                                width: MediaQuery.of(context).size.width / 2,
                                height: 80,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Visibility(
        visible: currentPageIndex != 3,
        child: Padding(
          padding: const EdgeInsets.only(left: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Visibility(
                visible: currentPageIndex != 0,
                child: FloatingActionButton(
                  onPressed: () {
                    pageViewController.previousPage(
                        duration: Durations.medium1, curve: Curves.linear);
                  },
                  clipBehavior: Clip.hardEdge,
                  shape: const CircleBorder(),
                  backgroundColor: Colors.white,
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Color(0xFF004aad),
                    size: 30,
                    weight: 100,
                  ),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  pageViewController.nextPage(
                      duration: Durations.medium1, curve: Curves.linear);
                },
                clipBehavior: Clip.hardEdge,
                shape: const CircleBorder(),
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF004aad),
                  size: 30,
                  weight: 100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Question extends StatefulWidget {
  const Question({
    super.key,
    required this.title,
    required this.groupValue,
    required this.callback,
  });
  final String title;
  final int groupValue;
  final Function(int) callback;
  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        //vertical: 24,
        horizontal: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: [
          Text(
            widget.title,
            textAlign: TextAlign.left,
            style: GoogleFonts.leagueSpartan(
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 5,
            children: [
              Radio.adaptive(
                value: 0,
                groupValue: widget.groupValue,
                onChanged: (value) {
                  setState(() {
                    widget.callback(0);
                  });
                },
              ),
              Text(
                'No',
                style: GoogleFonts.leagueSpartan(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 5,
            children: [
              Radio.adaptive(
                value: 1,
                groupValue: widget.groupValue,
                onChanged: (value) {
                  setState(() {
                    widget.callback(1);
                  });
                },
              ),
              Text(
                'Yes',
                style: GoogleFonts.leagueSpartan(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
