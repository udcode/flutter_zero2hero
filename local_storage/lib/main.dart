import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:local_storage/ioc.dart';
import 'package:local_storage/task_repo.dart';

import 'note_model.dart';

void main() async {
  await configureDependencies();
  // await Hive.initFlutter();
  // Hive.registerAdapter(HivedNoteAdapter());
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotesPage(),
    );
  }
}

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
   // Box<HivedNote>? notesBox;

  @override
  void initState() {
    super.initState();
    // openBox();
    // getIt<TaskRepository>().getTasks();
  }

  Future<void> openBox() async {
    // notesBox = await Hive.openBox<HivedNote>('notes');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes Manager')),
      // body: notesBox?.isOpen == true
      //     ? ListView.builder(
      body: ListView.builder(
        // itemCount: notesBox!.length,
        itemCount: getIt<TaskRepository>().getTasks().length,
        itemBuilder: (context, index) {
          // final note = notesBox!.getAt(index);
final note = getIt<TaskRepository>().getTasks()[index];
          return ListTile(
            title: Text(note!.note),
            subtitle: Text(note!.createdAt.toString()),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // notesBox!.deleteAt(index);
                final taskRepo = getIt<TaskRepository>();
                taskRepo.deleteTask(note.id!);
                setState(() {});
              },
            ),
          );
        },
      ),
          // : Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newNote = await showDialog<String>(
            context: context,
            builder: (context) => AddNoteDialog(),
          );
          if (newNote != null) {
            var hivedNote = HivedNote(newNote,DateTime.now(),newNote);
            final taskRepo = getIt<TaskRepository>();

            taskRepo.saveTask(hivedNote);
            // notesBox!.add(hivedNote);
            setState(() {});
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}



class AddNoteDialog extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Note'),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: 'Enter your note here'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, controller.text),
          child: Text('Add'),
        ),
      ],
    );
  }
}