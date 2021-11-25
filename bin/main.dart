import 'doubly_node.dart';

void main(List<String> arguments) {
  DoublyLinkedList<String> list = DoublyLinkedList();
  list.add('a');
  list.add('b');
  list.add('c');
  list.add('d');
  list.add('e');
  print(list.toString());
  list.insert(1, 'z');
  list.update(5, '5');
  print(list.toString());
  print(list.indexOf('c'));
  var z = list.valueOf(2);
  print(z);
  var l = list.toList();
  print(l);
  print(l.runtimeType);
}
