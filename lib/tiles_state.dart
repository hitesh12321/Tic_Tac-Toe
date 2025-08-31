import 'dart:math';

enum Tilestate { EMPTY, CIRCLE, CROSS }

List<List<Tilestate>> chunk(List<Tilestate> list, int size) {
  return List.generate(
    (list.length / size).ceil(), //size of new sublist
    (index) =>
        list.sublist(index * size, min(index * size + size, list.length),),
  );
}
