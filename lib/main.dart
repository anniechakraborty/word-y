import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData.dark().copyWith(
        accentColor: Colors.purple[900],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _randomWordPair = <WordPair>[];
  Widget _buildWordList() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, items) {
        if (items.isOdd) {
          return Divider();
        }
        final index = items ~/ 2;
        if (index >= _randomWordPair.length) {
          _randomWordPair.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_randomWordPair[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: TextStyle(
          fontSize: 15.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Word-Y',
        ),
      ),
      body: _buildWordList(),
    );
  }
}
