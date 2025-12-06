import 'dart:io';

void main() {
  // handle exception

  String? name;

  // stdout.write('enter your age: ');

  try {
    // int age = int.parse(stdin.readLineSync() ?? "");
    // print(age);
    print(name!.length);
  } on FormatException catch (e) {
    print('error: format exception');
  } 
  //! Api --> timeOut
}
