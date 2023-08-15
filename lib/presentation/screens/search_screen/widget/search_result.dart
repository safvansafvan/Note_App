import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/controller/provider/search_provider.dart';
import 'package:provider/provider.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, value, _) {
        return value.foundedNotes.isEmpty
            ? Center(
                child: Lottie.asset("assets/empty2.json"),
              )
            : ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        value.foundedNotes[index].subject.toString(),
                        style: TextStyle(color: Colors.amber),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.all(10),
                    child: Divider(),
                  );
                },
                itemCount: value.foundedNotes.length);
      },
    );
  }
}
