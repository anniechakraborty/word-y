import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

const textStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.white,
  wordSpacing: 2.0,
  fontStyle: FontStyle.italic,
);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _randomWordPair = <WordPair>[];
  final _savedWordPairs = Set<WordPair>();
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
    final alreadySaved = _savedWordPairs.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: textStyle,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.redAccent : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _savedWordPairs.remove(pair);
          } else {
            _savedWordPairs.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _savedWordPairs.map((WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: textStyle,
          ),
        );
      });
      final List<Widget> _savedList = ListTile.divideTiles(
        tiles: tiles,
        context: context,
      ).toList();
      return Scaffold(
        appBar: AppBar(
          title: Text('Saved WordPairs'),
        ),
        body: ListView(
          children: _savedList,
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Word-Y',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.playlist_add),
            onPressed: _pushSaved,
          ),
        ],
      ),
      body: _buildWordList(),
    );
  }
}
