import 'package:dart_application_1/dart_application_1.dart'
    as dart_application_1;

void main(List<String> arguments) {
  print('Hello world: ${dart_application_1.calculate()}!');
  var list1 = [1, 2];
// 'list2' contains [-2, -1, 0, 1, 2]
  var list2 = [...list1];
  list2.add(56);
  print(list1);
  print(list2);
}
