import 'package:e_learning/databases/students.dart';
import 'package:e_learning/models/payment_model.dart';
import 'package:e_learning/models/user_model.dart';

import '../services/io_service.dart';
import 'group_model.dart';

class Student extends User {
  List<Group> groups;
  List<Payment> payments;
  double balance;

  Student({
    required this.balance,
    required this.groups,
    required this.payments,
    required super.firstname,
    required super.lastname,
    required super.age,
    required super.imageUrl,
    required super.birthdate,
    required super.gender,
    required super.phone,
    required super.password,
  }){
     //showStudents();
     selectStudents();
     selectedStudents();
  }
   showStudents(){
    for(int i = 0; i < students.length; i++){
      print("$i - student \n");
      print('Name : ${students[i].firstname}\n');
      print('surname : ${students[i].lastname}\n');
      print('Balance : ${students[i].balance}\n');
      print('Payments : ${students[i].payments}\n');
      print('groups : ${students[i].groups}\n');
      print('age : ${students[i].age}\n');
      print('gender : ${students[i].gender}\n');
      print('phone : ${students[i].phone}\n');
      print('password : ${students[i].password}\n');
    }
  }
  List list = [];
  selectStudents(){
    print('whould you want select students \n 1 -> yes');
    // select student
    String choose = io.text;
    if(choose == '1'){
      print('if you want to stop this selection just type anytime stop');
      while(true){
        String text = io.text;
        if(text == 'stop'){
          break;
        }
        else if(int.parse(text) < 0 && int.parse(text) > students.length){
          print('Wrong number');
        }else {
          list.add(int.parse(text));
        }
      }
    }
  }

  selectedStudents(){

    for(int i = 0; i < list.length; i++){
      int a = 0;
      a = list[i];
      print('you select $a.${students[a].firstname} \n');
    }

    print('do you want 1.edit or 2.delate students? ');
    String text = io.text;
    if(text == '1') {
      print('which do you want change from selected');

      for (int i = 1; i < list.length + 1; i++) {
        int a = 0;
        a = list[i];
        print('$a.${students[a - 1].firstname} \n');
      }
        String select = io.text;
        if (int.parse(select) > list.length && int.parse(select) < 0) {
          print('Wrong number');
          selectedStudents();
        }else{
          while(true) {
            print('1.name 2.surname 3.phone');
            String fields = io.text;
            switch (fields) {
              case '1':
                print('Enter new name \n');
                String name = io.text;
                int a = list[int.parse(select)];
                students[a].firstname = name;
                break;
              case '2' :
                print('Enter new lastname');
                String lastName = io.text;
                int a = list[int.parse(select)];
                students[a].lastname = lastname;
                break;
              case '3' :
                print('Enter new phone');
                String phone = io.text;
                int a = list[int.parse(select)];
                students[a].phone = phone;
                break;
            }
            print('you want continue ? 1.yes 2.no');
            String continue1 = io.text;
            if(continue1 == '2'){
              break;
            }
          }
        }
      }
    else if(text == '2'){
      for(int i = 0; i < list.length; i++){
        int a = 0;
        a = list[i];
        print('you select $a.${students[a].firstname} \n');
      }
      print('Enter which one you want to delate ? \n');
      String text = io.text;
      int number = int.parse(text);
      students.removeAt(number);

    }
  }
  @override
  String toString(){
    return '$balance $groups $payments $firstname $lastname $age $gender $phone $password';
  }

  @override
  noSuchMethod(Invocation invocation) {
    print("Noto'g'ri qiymay");
  }
}
