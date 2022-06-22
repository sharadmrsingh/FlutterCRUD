//import 'package:fl_crud/models/model.dart';
import 'package:flutter/material.dart';
import '../models/model.dart';
import '../services/index.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  dynamic v;
  final TextEditingController inp1 = TextEditingController();
  final TextEditingController inp2 = TextEditingController();
  final TextEditingController inp3 = TextEditingController();
  Service s = new Service();
  //Future<Model>? post;
  //Future<List<Model>>? post;
  //List<Model>? post;
  //Service s = new Service();
  @override
  void initState() {
    super.initState();

    // post = s
    //     .fetchdata(); //s.fetchdata()as Future<Model>?; //as List<Model>?; //Future<List<Model>>?;
    // print('post=' + post.toString());
  }

  /*callf() async {
    post = await s.fetchdata();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<List<Model>>(
              future: s.fetchdata(), //callf(),
              builder: (context, AsyncSnapshot<List<Model>> snapshot) {
                if (snapshot.hasData) {
                  print('We are in item.hasdata');
                  return Column(
                    children: [
                      ...snapshot.data!.map((e) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(e.sId ?? ''),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(e.name ?? ''),
                          ],
                        );
                      }).toList()
                    ],
                  );
                } else if (snapshot.hasError) {
                  print('We are in item.error');
                  return Text(snapshot.error.toString());
                }
                return const CircularProgressIndicator();
              },
            ),
            //First Text Field
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: inp1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Add id',
                  hintText: 'Enter id of the name you want to delete',
                ),
              ),
            ),
            //Second Text Field
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: inp2,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Add name',
                  hintText: 'Add name',
                ),
              ),
            ),
            //Third Text Field
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: inp3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Add name',
                  hintText:
                      'Enter new name and also fill first text field of id and leave the second text field as blank',
                ),
              ),
            ),

            //Add Button
            ElevatedButton(
              child: const Text('Add'),
              onPressed: () => add(),
            ),

            //For spacing between buttons
            const SizedBox(
              height: 10,
            ),

            //Delete Button
            ElevatedButton(
              child: const Text('Delete'),
              onPressed: () => delete(),
            ),

            //For spacing between buttons
            const SizedBox(
              height: 10,
            ),

            //Update Button
            ElevatedButton(
              child: const Text('Update'),
              onPressed: () => modify(),
            ),
          ],
        ),
      ),
    );
  }

//add function
  add() {
    print('value in add=' + inp2.text);
    s.adddata(inp2.text);
  }

//delete function
  delete() {
    print('value in delete=' + inp1.text);
    s.deletedata(inp1.text);
  }

  //modify function
  modify() {
    print('value in modify=' + inp3.text);
    s.modifydata(inp1.text, inp3.text);
  }
}
