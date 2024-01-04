import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'chapters/chapter3/page20_21.dart';
import 'chapters/index.dart'; // Import the index.dart file

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FlutterTts flutterTts = FlutterTts();
  List<String> chapters = [
    Page1_2.getTextContent(),
    Page3_4.getTextContent(),
    Page5_6.getTextContent(),
    Page7_8.getTextContent(),
    Page9_10.getTextContent(),
    Page11_12.getTextContent(),
    Page13_14.getTextContent(),
    Page15_16.getTextContent(),
    Page17_18.getTextContent(),
    Page19_20.getTextContent(),
    Page20_21.getTextContent(),
    Page22_23.getTextContent(),
    Page24_25.getTextContent(),
    Page26_27.getTextContent(),
    Page28.getTextContent(),
    Page28_29.getTextContent(),
    Page30_31.getTextContent(),
    Page32_33.getTextContent(),
    Page34_35.getTextContent(),
    Page35.getTextContent(),
    Page350.getTextContent(),
    Page36_37.getTextContent(),
    Page38_39.getTextContent(),
    Page40_41.getTextContent(),
    Page42_43.getTextContent(),
    Page44_45.getTextContent(),
    Page45.getTextContent(),
    Page46_47.getTextContent(),
    Page48_49.getTextContent(),
    Page50_51.getTextContent(),
    Page51_52.getTextContent(),
    Page53_54.getTextContent(),
    Page55_56.getTextContent(),
    Page57_58.getTextContent(),
    Page59_60.getTextContent(),
    Page61_62.getTextContent(),
    Page63_64.getTextContent(),
    Page65_66.getTextContent(),
    Page67_68.getTextContent(),
    Page69_70.getTextContent(),
    Page71.getTextContent(),
    Page710.getTextContent(),
    Page72_73.getTextContent(),
    Page74_75.getTextContent(),
    Page76_77.getTextContent(),
    Page78_79.getTextContent(),
    Page79.getTextContent(),
    Page80.getTextContent(),
  ];
  int currentChapterIndex = 0;
  double speed = 0.5;
  bool isPlaying = false;
  bool isRepeating = false;
  int currentSpeechPosition = 0;

  Future<void> speak() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(speed);

    String currentChapter = chapters[currentChapterIndex];
    String remainingText = currentChapter.substring(currentSpeechPosition);

    await flutterTts.speak(remainingText);

    flutterTts.setCompletionHandler(() {
      setState(() {
        isPlaying = false;
        currentSpeechPosition = 0;
        if (isRepeating) {
          isPlaying = true;
          speak();
        } else if (currentChapterIndex < chapters.length - 1) {
          currentChapterIndex++;
          speak();
        }
      });
    });
  }

  Future<void> pause() async {
    await flutterTts.pause();
    setState(() {
      isPlaying = false;
    });
  }

  Future<void> stop() async {
    await flutterTts.stop();
    setState(() {
      currentSpeechPosition = 0;
      isPlaying = false;
    });
  }

  Future<void> nextChapter() async {
    if (currentChapterIndex < chapters.length - 1) {
      currentChapterIndex++;
      setState(() {
        currentSpeechPosition = 0;
        isPlaying = true;
      });
      await speak();
    }
  }

  Future<void> previousChapter() async {
    if (currentChapterIndex > 0) {
      currentChapterIndex--;
      setState(() {
        currentSpeechPosition = 0;
        isPlaying = true;
      });
      await speak();
    }
  }

  Future<void> setSpeed(double newSpeed) async {
    if (isPlaying) {
      await flutterTts.pause();
      double previousSpeed = speed;
      double positionPercentage =
          currentSpeechPosition / chapters[currentChapterIndex].length;

      await flutterTts.stop();
      await flutterTts.setSpeechRate(newSpeed);
      await flutterTts.setLanguage("en-US");

      String currentChapter = chapters[currentChapterIndex];
      int newPosition = (positionPercentage * currentChapter.length).round();
      String remainingText = currentChapter.substring(newPosition);

      await flutterTts.speak(remainingText);
    } else {
      await flutterTts.setSpeechRate(newSpeed);
    }

    setState(() {
      speed = newSpeed;
      isPlaying = true;
    });
  }

  void _showChaptersList(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: ListView.builder(
            itemCount: chapters.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('Chapter'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    currentChapterIndex = index;
                    currentSpeechPosition = 0;
                    isPlaying = true;
                  });
                  speak();
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    flutterTts.setCompletionHandler(() {
      setState(() {
        isPlaying = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Life Changer'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  chapters[currentChapterIndex],
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.skip_previous,
                    color: Colors.blue,
                  ),
                  onPressed: () => previousChapter(),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    if (isPlaying) {
                      pause();
                    } else {
                      speak();
                    }
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  },
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(
                    Icons.skip_next,
                    color: Colors.blue,
                  ),
                  onPressed: () => nextChapter(),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(
                    Icons.repeat,
                    color: isRepeating ? Colors.green : Colors.blue,
                  ),
                  onPressed: () {
                    setState(() {
                      isRepeating = !isRepeating;
                      currentSpeechPosition = 0;
                      isPlaying = true;
                    });
                    speak();
                  },
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<double>(
                  value: speed ?? 0.5,
                  onChanged: (newSpeed) async {
                    await setSpeed(newSpeed!);
                  },
                  style: TextStyle(color: Colors.black),
                  dropdownColor: Colors.white,
                  underline: Container(
                    height: 2,
                    color: Colors.blue,
                  ),
                  items: [0.25, 0.5, 1.0, 1.5]
                      .map<DropdownMenuItem<double>>(
                        (value) => DropdownMenuItem<double>(
                          value: value,
                          child: Text(
                            '$value x',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
