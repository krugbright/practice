import 'package:chapter_5/linked_list.dart';

void main(List<String> arguments) {
  challenge2();
}

void challenge1() {
  final list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  print(list.head.toString());
  //reverseLinkedList(list);
  printListInReverse(list);
}

/// first way is to remove from last to first
void reverseLinkedList<E>(LinkedList<E> list) {
  for (int i = list.length - 1; i >= 0; i--) {
    var rmValue = list.removeLast();
    print("$rmValue ");
  }
}

/// this is the best way, just describe a recursive function
void printNodesRecursively<T>(Node<T>? node) {
// 1 stop function when node is null
  if (node == null) return;
// 2
  printNodesRecursively(node.next);
// 3
  print(node.value);
}

void printListInReverse<E>(LinkedList<E> list) {
  printNodesRecursively(list.head);
}

void challenge2() {
  final list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  final middleNode = getMiddle(list);
  print('Middle: ${middleNode?.value}');
}

Node<E>? getMiddle<E>(LinkedList<E> list) {
  var slow = list.head;
  var fast = list.head;
  while (fast?.next != null) {
    fast = fast?.next?.next;
    slow = slow?.next;
  }
  return slow;
}

extension ReversibleLinkedList<E> on LinkedList<E> {
  void reverse() {
    final tempList = LinkedList<E>();
    for (final value in this) {
      tempList.push(value);
    }
    head = tempList.head;
  }
}
