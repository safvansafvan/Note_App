import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/controller/provider/search_provider.dart';
import 'package:note_app/screens/screens/search_screen/widget/search_result.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<SearchProvider>(context, listen: false).getAllNotes();
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Provider.of<SearchProvider>(context, listen: false)
                        .clearController();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              Consumer<SearchProvider>(builder: (context, values, _) {
                return CupertinoSearchTextField(
                  controller: values.searchController,
                  onChanged: (value) {
                    values.filterNotes();
                    if (value.isEmpty) {
                      values.hideNotes();
                    } else {
                      values.showNotes();
                    }
                  },
                  onSubmitted: (value) {},
                );
              }),
              Consumer<SearchProvider>(
                builder: (context, value, _) {
                  return value.isShowNotes
                      ? const SearchResultWidget()
                      : Center(child: Lottie.asset("assets/empty2.json"));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
