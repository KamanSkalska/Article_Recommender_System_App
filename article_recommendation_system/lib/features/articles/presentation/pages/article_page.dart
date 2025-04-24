import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Articles Recommendations For You'),
            actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.add_circled,
              ))
        ]));
  }
}
