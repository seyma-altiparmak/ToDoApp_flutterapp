
import 'package:todoapp_flutterapp/data/entity/todo.dart';
import 'package:todoapp_flutterapp/sqlite/databasehelper.dart';

class ToDoDaoRepository{
  Future<void> Save(String note) async{
    var db = await DatabaseHelper.databaseAccess();
    var newNote = Map<String,dynamic>();

    newNote["todo_note"] = note;
    await db.insert("ToDo", newNote);
  }
  Future<void> UpdateNote(int id,String note) async{
    var db = await DatabaseHelper.databaseAccess();
    var updateNote = Map<String,dynamic>();

    updateNote["todo_note"] = note;

    await db.update("ToDo", updateNote, where: "todo_id = ?", whereArgs: [id]);
  }
  Future<void> delete(int id) async {
    var db = await DatabaseHelper.databaseAccess();
    await db.delete("ToDo", where: "todo_id = ?", whereArgs: [id]);
  }
  Future<List<ToDo>> noteLoad() async {
    var db = await DatabaseHelper.databaseAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM ToDo");

    return List.generate((maps.length), (i)
    {
      var row = maps[i];
      return ToDo(todo_id: row["todo_id"], todo_name: row["todo_note"]);
    });
  }
  Future<List<ToDo>> search(String searchWord) async {
    var db = await DatabaseHelper.databaseAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM ToDo WHERE todo_note LIKE '%$searchWord%'");

    return List.generate((maps.length), (i)
    {
      var row = maps[i];
      return ToDo(todo_id: row["todo_id"], todo_name: row["todo_note"]);
    });
  }
}