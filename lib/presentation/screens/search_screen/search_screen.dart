import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/controller/provider/search_provider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              Consumer<SearchProvider>(builder: (context, values, _) {
                return CupertinoSearchTextField(
                  onChanged: (value) {},
                  onSubmitted: (value) {},
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
