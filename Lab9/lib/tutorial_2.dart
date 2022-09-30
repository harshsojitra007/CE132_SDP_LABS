
import 'package:flutter/material.dart';
import 'package:lab8/quote_card.dart';
import 'package:lab8/quotes.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    ));

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Quote> quotes = [
    Quote(text: "The truth is really pure and never simple", author: "Harsh"),
    Quote(text: "Hard work pays off", author: "Unknown"),
    Quote(text: "fine by me", author: "Harsh Sojitra")
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue[200]),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Quotes"),
          centerTitle: true,
          backgroundColor: Colors.blue[400],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: quotes
              .map((e) => QuoteCard(
                  quote: e,
                  delete: () {
                    setState(() {
                      quotes.remove(e);
                    });
                  }))
              .toList(),
        ),
      ),
    );
  }
}
