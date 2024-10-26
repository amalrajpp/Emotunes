import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _SearchPageState();
}

class _SearchPageState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Text(
            "People",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          actions: [
            Container(
              // color: Colors.amber,
              padding: EdgeInsets.only(right: 5),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.account_circle_rounded,
                    size: 40,
                  )),
            )
          ],
          automaticallyImplyLeading: false,
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          // inside the <> you enter the type of your stream
          stream: FirebaseFirestore.instance.collection("user").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                            topRight: Radius.circular(8.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              offset: const Offset(1.1, 1.1),
                              blurRadius: 10.0),
                        ],
                      ),
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text(
                          snapshot.data!.docs[index].get('mail'),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            if (snapshot.hasError) {
              return const Text('Error');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ));
  }
}
