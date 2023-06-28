import 'package:challenge/stack.dart';

void main(List<String> arguments) {
  //challengeOne();
  challengeTwo();
}

void challengeOne() {
  var list = ["E", "S", "T", "H", "E", "R"];
  printReverseList(list);
}

void printReverseList<E>(List<E> list) {
  var stack = Stack.of(list);

  while (stack.isNotEmpty) {
    print(stack.pop());
  }
}

void challengeTwo() {
  print(checkBalancedParentheses('h((e))llo(world)()'));
  print(checkBalancedParentheses('(hello world'));
  print(checkBalancedParentheses('hello)(world'));
}

bool checkBalancedParentheses(String text) {
  var stack = Stack<int>();

  int openP = '('.codeUnitAt(0);
  int closeP = ')'.codeUnitAt(0);

  for (var t in text.codeUnits) {
    if (t == openP) {
      stack.push(t);
    } else if (t == closeP) {
      if (stack.isEmpty) {
        return false;
      } else {
        stack.pop();
      }
    }
  }

  return stack.isEmpty;
}
