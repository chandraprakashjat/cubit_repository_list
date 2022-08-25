import 'package:equatable/equatable.dart';

class Item extends Equatable {
  Item({required this.index, required this.value, this.isDeleting = false});

  final String value;
  final int index;
  bool isDeleting;

  @override
  List<Object?> props() => [index, value];
}
