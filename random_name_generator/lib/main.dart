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

  Widget _randomTile(WordPair pair, int i) {
    return Card(
      child: ListTile(
        title: Text(pair.asPascalCase),
        leading: Text(i.toString()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
   // _randomWordslist.addAll(generateWordPairs().take(10));
    return ListView.builder(
        //itemCount: _randomWordslist.length,
        itemBuilder: (context, index) {
          if(index>=_randomWordslist.length)
          {
            _randomWordslist.addAll(generateWordPairs().take(10));
          }
      

      return _randomTile(_randomWordslist[index], index);
    });
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Word Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Random Word Generator')),
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}
