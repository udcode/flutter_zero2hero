import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
part 'main.g.dart';
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(HivedNoteAdapter());
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
   Box<HivedNote>? notesBox;

  @override
  void initState() {
    super.initState();
    openBox();
  }

  Future<void> openBox() async {
    notesBox = await Hive.openBox<HivedNote>('notes');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes Manager')),
      body: notesBox?.isOpen == true
          ? ListView.builder(
        itemCount: notesBox!.length,
        itemBuilder: (context, index) {
          final note = notesBox!.getAt(index);

          return ListTile(
            title: Text(note!.note),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                notesBox!.deleteAt(index);
                setState(() {});
              },
            ),
          );
        },
      )
          : Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newNote = await showDialog<String>(
            context: context,
            builder: (context) => AddNoteDialog(),
          );
          if (newNote != null) {
            var hivedNote = HivedNote(newNote,DateTime.now());
            notesBox!.add(hivedNote);
            setState(() {});
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

@HiveType(typeId: 0)
@JsonSerializable()
class HivedNote {
  @HiveField(0)
  final String note;
  @HiveField(1)
  final DateTime createdAt;

  HivedNote(this.note,this.createdAt);

  factory HivedNote.fromJson(Map<String, dynamic> json) => _$HivedNoteFromJson(json);

  Map<String, dynamic> toJson() => _$HivedNoteToJson(this);
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