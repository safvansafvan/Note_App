import 'package:flutter/material.dart';
import 'package:note_app/controller/core/constant.dart';
import 'package:note_app/presentation/screens/add_note/add_note.dart';
import 'package:note_app/presentation/screens/note_details/note_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu, color: CustomClr.kwhite),
            ),
            backgroundColor: Colors.deepPurple[400],
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: CustomClr.deepPurple,
              ),
              title: Text(
                "N o t e A p p",
                style: CustomFuction.texttStyle(
                    weight: FontWeight.w600, color: CustomClr.kwhite, size: 16),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: CustomSize.commonRadius,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NoteDetailsScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 150,
                        color: Colors.deepPurple[300],
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.delete_outline_outlined,
                                      color: CustomClr.kred,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.edit,
                                        color: CustomClr.kblue),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Subject:  ",
                                    style: CustomFuction.texttStyle(
                                        weight: FontWeight.w500,
                                        color: CustomClr.kblack,
                                        size: 16),
                                  ),
                                  Text(
                                    "TodayPayment",
                                    style: CustomFuction.texttStyle(
                                        weight: FontWeight.w500,
                                        color: CustomClr.kblack,
                                        size: 16),
                                  ),
                                ],
                              ),
                              CustomHeight.height10,
                              Row(
                                children: [
                                  Text(
                                    "Content: ",
                                    style: CustomFuction.texttStyle(
                                        weight: FontWeight.w500,
                                        color: CustomClr.kblack,
                                        size: 16),
                                  ),
                                  Text(
                                    "................",
                                    style: CustomFuction.texttStyle(
                                        weight: FontWeight.w500,
                                        color: CustomClr.kblack,
                                        size: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: 5,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNoteScreen(),
            ),
          );
        },
        label: const Text("Note", style: TextStyle(fontSize: 13)),
        tooltip: "add new note",
        elevation: 15,
        icon: const Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: CustomSize.commonRadius,
        ),
        hoverColor: CustomClr.deepPurple,
      ),
    );
  }
}
