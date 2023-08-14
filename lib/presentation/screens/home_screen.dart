import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
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
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('notes').snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (!snapshot.hasData) {
                return SliverFillRemaining(
                  child: Center(child: Lottie.asset("assets/empty.json")),
                );
              }
              if (snapshot.data!.docs.isEmpty) {
                return SliverFillRemaining(
                  child: Center(
                    child: Lottie.asset("assets/empty.json"),
                  ),
                );
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    Map<String, dynamic> snap =
                        snapshot.data!.docs[index].data();
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: CustomSize.commonRadius,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NoteDetailsScreen(
                                  content: snap['content'],
                                  date: DateFormat.yMEd()
                                      .format(snap['date'].toDate()),
                                  subject: snap['subject'],
                                ),
                              ),
                            );
                          },
                          child: Container(
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
                                        snap['subject'],
                                        style: CustomFuction.texttStyle(
                                          weight: FontWeight.w500,
                                          color: CustomClr.kblack,
                                          size: 16,
                                        ),
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
                                      Expanded(
                                        child: Text(
                                          snap['content'],
                                          style: CustomFuction.texttStyle(
                                              weight: FontWeight.w500,
                                              color: CustomClr.kblack,
                                              size: 16),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  CustomHeight.height10,
                                  Row(
                                    children: [
                                      Text(
                                        "Date: ",
                                        style: CustomFuction.texttStyle(
                                            weight: FontWeight.w500,
                                            color: CustomClr.kblack,
                                            size: 16),
                                      ),
                                      Text(DateFormat.yMEd()
                                          .format(snap['date'].toDate()))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: snapshot.data!.docs.length,
                ),
              );
            },
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
