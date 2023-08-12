import 'package:flutter/material.dart';
import 'package:note_app/core/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            backgroundColor: CustomClr.deepPurple,
            expandedHeight: 250,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: CustomClr.deepPurple,
              ),
              title: const Text("Note App"),
            ),
          )
        ],
      ),
    );
  }
}
