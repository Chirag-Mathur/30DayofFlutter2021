import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final wordpair = WordPair.random();
  final List<WordPair> _randomWordslist = <WordPair>[];
  final Set<WordPair> _likedWords = {};

  Widget _randomTile(WordPair pair, int i) {
    var _isLiked = _likedWords.contains(pair);
    return Card(
      child: ListTile(
        title: Text(pair.asPascalCase),
        leading: Text(i.toString()),
        trailing: IconButton(
          icon: Icon(
            _isLiked ? Icons.favorite : Icons.favorite_outline,
            color: _isLiked ? Colors.red : Colors.black,
          ),
          onPressed: () {
            setState(() {
              _isLiked = !_isLiked;
            });
            if (_isLiked) {
              _likedWords.add(pair);
            } else {
              _likedWords.remove(pair);
            }
          },
        ),
      ),
    );
  }

  void _likedList() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Liked Names'),
            ),
            body: ListView.builder(
              itemCount: _likedWords.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(_likedWords.elementAt(index).asPascalCase),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // _randomWordslist.addAll(generateWordPairs().take(10));
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Word Generator'),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _likedList),
        ],
      ),
      body: ListView.builder(
          //itemCount: _randomWordslist.length,
          itemBuilder: (context, index) {
        if (index >= _randomWordslist.length) {
          _randomWordslist.addAll(generateWordPairs().take(10));
        }

        return _randomTile(_randomWordslist[index], index);
      }),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Word Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: RandomWords(),
    );
  }
}
