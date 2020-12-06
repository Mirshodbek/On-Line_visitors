import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_visitors/provider/provider.dart';
import 'package:online_visitors/screens/stand_on_line_screen.dart';
import 'package:online_visitors/toast/toast.dart';
import 'package:provider/provider.dart';

class ListOfBooked extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BrainProvider>(
      builder: (context, brain, child) {
        return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('user')
                .orderBy('timestamp', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              List<DocumentSnapshot> _myDocCount;
              int countPerson;
              if (snapshot.hasData) {
                _myDocCount = snapshot.data.docs;
                countPerson = _myDocCount.length;
              }
              deleteUser() {
                brain.cloudFireStore
                    .collection('user')
                    .doc(snapshot.data.docs[0].id)
                    .delete();
                BrainProvider.result = false;
                ToastUtils.showCustomToast(
                    context, 'You have denied your line!');
              }

              return ListTile(
                onLongPress: () {
                  deleteUser();
                },
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StandOnLineScreen(
                          // index: index,
                          ),
                    ),
                  );
                },
                title: Text(
                    'You are in $countPerson - line.\nThere are ${countPerson - 1} visitors before you.'),
                trailing: Column(
                  children: [
                    Icon(
                      Icons.people_alt_rounded,
                    ),
                    Text('$countPerson')
                  ],
                ),
              );
            });
      },
    );
  }
}
