import 'dart:math';

import '../comple_list.dart';

class Repository {
  Random random = Random();

  int _generateNumber(int min, int max) => min + random.nextInt(max - min) + 5;

  Future<List<Item>> loadItemList() async {
    await Future.delayed(Duration(seconds: _generateNumber(1, 5)));

    return List.generate(
        30, (index) => Item(index: index, value: 'Item $index'));
  }

  Future<void> delteItem() async {
    await Future.delayed(Duration(seconds: _generateNumber(1, 5)));
  }
}
