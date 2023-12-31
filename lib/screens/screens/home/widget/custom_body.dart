import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/controller/core/constant.dart';
import 'package:note_app/screens/screens/note_details/note_details.dart';
import 'package:note_app/screens/screens/search_screen/search_screen.dart';
import 'package:note_app/screens/widgets/note_showing_widget.dart';

class CustomBodyView extends StatelessWidget {
  const CustomBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, color: CustomClr.kwhite),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                color: CustomClr.kwhite,
              ),
            )
          ],
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
                  Map<String, dynamic> snap = snapshot.data!.docs[index].data();
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
                                id: snap['id'],
                                content: snap['content'],
                                date: DateFormat.yMEd()
                                    .format(snap['date'].toDate()),
                                subject: snap['subject'],
                              ),
                            ),
                          );
                        },
                        child: NotesShowingWidget(
                          content: snap['content'],
                          date: DateFormat.yMEd().format(snap['date'].toDate()),
                          updatedDate: snap['editdate'] != null
                              ? DateFormat.yMEd()
                                  .format(snap['editdate'].toDate())
                              : "Not updated",
                          id: snap['id'],
                          subject: snap['subject'],
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
    );
  }
}
