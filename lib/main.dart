import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WordLetterCounter(),
    );
  }
}

class WordLetterCounter extends StatefulWidget {
  @override
  _WordLetterCounterState createState() => _WordLetterCounterState();
}

class _WordLetterCounterState extends State<WordLetterCounter> {
  TextEditingController _controller = TextEditingController();
  String wordCount = '0';
  String letterCount = '0';
  String userText = "";
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  void _countWordsAndLetters() {
    String text = _controller.text.trim();
    List<String> words = text.split(RegExp(r'\s+'));
    int wordTotal = words.isEmpty ? 0 : words.length;
    int letterTotal = text.replaceAll(RegExp(r'\s+'), '').length;

    setState(() {
      userText = text;
      wordCount = wordTotal.toString();
      letterCount = letterTotal.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Container(
            height: 500, // Set the specific height for the container
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.orange, // Orange border color
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Title with no border around it
                    Text(
                      "Text Counter",
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 40),
                    // Card with the word count and letter count
                    Card(
                      color: Colors.white, // White background for the card
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text('Your Text: $userText', style: TextStyle(fontSize: 20, color: Colors.black)),
                            Text('Word Count: $wordCount', style: TextStyle(fontSize: 20, color: Colors.black)),
                            Text('Letter Count: $letterCount', style: TextStyle(fontSize: 20, color: Colors.black)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // TextField with focus-based label text color change
                    TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Enter Text',
                        labelStyle: TextStyle(
                          color: _focusNode.hasFocus ? Colors.orange : Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.orange, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.orange, // Color for the border when focused
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _countWordsAndLetters,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: Size(200, 50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text('Count', style: TextStyle(fontSize: 14)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
