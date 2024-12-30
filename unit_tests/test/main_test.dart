import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_tests/demo_service.dart';

import 'package:unit_tests/main.dart';

import 'main_test.mocks.dart';
import 'package:faker/faker.dart';


class FakeDatabase implements Database {
  final Map<String, dynamic> _data = {};

  @override
  Future<String> fetchData(String key) {
    return Future.value(_data[key]);
  }

  @override
  Future<void> saveData(String key, dynamic data) {
    return Future.delayed(Duration.zero, () {
      _data[key] = data;
    });
  }

  @override
  Future<Map> fetchAllData() async{
    return _data;

  }
}


@GenerateNiceMocks([MockSpec<DemoService>()])
void main() {

  final faker = Faker();

  group('testing demo service', (){
    test('Insert first element', ()async{
      final service = DemoServiceImpl(FakeDatabase());
      final items = await service.fetchItems();
      //expect items is empty
      expect(items, {});
      //insert first element
      await service.addItem('first', 'first');
      final itemsAfterInsert = await service.fetchItems();
      //expect items has one element
      expect(itemsAfterInsert, {'first': 'first'});
      expect(itemsAfterInsert.length, 1);
    });


    test('Insert multiple elements', ()async{
      final service = DemoServiceImpl(FakeDatabase());
      final items = await service.fetchItems();
      //expect items is empty
      expect(items, {});
      //insert first element
      for(int i = 0; i < 10; i++){
        await service.addItem(faker.guid.guid(),{'name': faker.person.name(), 'age': faker.randomGenerator.integer(100)});
      }
      print(await service.fetchItems());
      expect((await service.fetchItems()).keys, hasLength(10));
    });

  });

}