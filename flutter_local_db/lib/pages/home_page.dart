import 'package:flutter/material.dart';
import 'package:flutter_local_db/data/local/db_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<Map<String, dynamic>> allNotes = [];
  DBHelper? dbRef;

  @override
  void initState() {
    super.initState();

    dbRef = DBHelper.getInstance();
    _getAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notes",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: allNotes.isEmpty
          ? const Center(
              child: Text('No Notes yet.'),
            )
          : Container(
              color: Colors.white,
              child: ListView.separated(
                  itemCount: allNotes.length,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 11,
                    );
                  },
                  itemBuilder: (_, index) {
                    return Dismissible(
                      background: Container(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        alignment: Alignment.centerLeft,
                        color: Colors.red,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.delete),
                            Icon(Icons.delete),
                          ],
                        ),
                      ),
                      key: Key('${allNotes[index][DBHelper.NOTES_COL_TITLE]}'),
                      onDismissed: (direction) async {
                        if (direction == DismissDirection.startToEnd || direction == DismissDirection.endToStart) {
                          bool check = await dbRef!.deleteNotes(
                              id: allNotes[index][DBHelper.NOTES_COL_ID]);

                          if (check) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Note Deleted Successfully!')));
                            _getAllNotes();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Unable to delete note. Try again!')));
                          }
                        } else {}
                      },
                      child: ListTile(
                        leading: Text(
                          '${index + 1}.',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        title: Text(
                          '${allNotes[index][DBHelper.NOTES_COL_TITLE]}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Text(
                            '${allNotes[index][DBHelper.NOTES_COL_DESCRIPTION]}'),
                        trailing: IconButton(
                            onPressed: () async {
                              bool check = await dbRef!.updateNotes(
                                  noteTitle: titleController.text,
                                  noteDescription: descriptionController.text,
                                  id: allNotes[index][DBHelper.NOTES_COL_ID]);

                              if (check) {
                                _getAllNotes();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Unable to update note. Try again!')));
                              }
                            },
                            icon: const Icon(Icons.edit)),
                      ),
                    );
                  }),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return _getShowBottomSheet(context);
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Container _getShowBottomSheet(BuildContext context) {
    return Container(
                height: 400,
                padding:
                    const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Add Note',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          label: const Text('Title'),
                          hintText: "Enter Note Title",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11))),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    TextField(
                      controller: descriptionController,
                      maxLines: 5,
                      decoration: InputDecoration(
                          label: const Text('Description'),
                          alignLabelWithHint: true,
                          hintText: "Enter Description",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                titleController.clear();
                                descriptionController.clear();
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(fontSize: 16),
                              )),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              onPressed: () async {
                                var title = titleController.text;
                                var description = descriptionController.text;

                                if (title.isNotEmpty &&
                                    description.isNotEmpty) {
                                  bool check = await dbRef!.addNotes(
                                      noteTitle: titleController.text,
                                      noteDescription:
                                          descriptionController.text);

                                  if (check) {
                                    _getAllNotes();
                                  }

                                  Navigator.pop(context);
                                  titleController.clear();
                                  descriptionController.clear();
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                        'Please fill all the required details.'),
                                  ));
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text(
                                'Add',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              );
  }

  void _getAllNotes() async {
    allNotes = await dbRef!.getAllNotes();

    setState(() {});
  }
}
