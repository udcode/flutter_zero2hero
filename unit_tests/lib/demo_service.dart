abstract class DemoService {
  /// Fetches a list of items.
  Future<Map> fetchItems();
}



class DemoServiceImpl implements DemoService {

final Database _database;

  DemoServiceImpl(this._database);

  @override
  Future<Map> fetchItems() async {
    return Future.delayed(Duration(seconds: 1), () => this._database.fetchAllData());
  }


  Future<void> addItem(String key, dynamic data) async {
    return this._database.saveData(key,data);
  }

  Future<String> fetchItem(String key) async {
    return this._database.fetchData(key);
  }
}




abstract class Database{
  Future<void> saveData(String key,dynamic data);
  Future<String> fetchData(String key);
  Future<Map> fetchAllData();
}


class DatabaseImpl implements Database {
  @override
  Future<String> fetchData(String key) async {
    return Future.delayed(Duration(seconds: 1), () => 'Data fetched');
  }

  @override
  Future<void> saveData(String key,dynamic data) async {
    return Future.delayed(Duration(seconds: 1), () => print('Data saved'));
  }

  @override
  Future<Map> fetchAllData() async{
    // TODO: implement fetchAllData
   return {};
  }
}