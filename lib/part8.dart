void main() {
  AdminUser admin =
      AdminUser(name: 'dima', rootAccess: true, email: 'admin@kdrc.ru');
  print('Почта ${admin.email}: домен ${admin.getEmailSystem()}');

  GeneralUser boss =
      GeneralUser(name: 'ludmila', age: 70, email: 'mail@yandex.ru');
  User simpleUser = User('pochta@rambler.ru');

  List<User> listik = List.empty(growable: true);
  listik.add(admin);
  listik.add(boss);

  UserManager m = UserManager(listik);
  m.addUser(simpleUser);

  //m.deleteUser(boss);
  print('\nСписок пользователей:');
  m.showUsers();

  print('\nСписок Почт и доменов:');
  m.showEmail();
}

class User {
  final String email;

  User(this.email);
}

class AdminUser extends User with getDomenfromEmail {
  final String name;
  final bool rootAccess;

  AdminUser(
      {required this.name, required this.rootAccess, required String email})
      : super(email);
}

mixin getDomenfromEmail on User {
  String getEmailSystem() {
    String s = '';
    var list = email.split('');
    for (int i = 0; i < list.length - i - 1; i++) {
      if (list[i] != '@') {
        list.removeAt(i);
        i--;
      } else {
        list.removeAt(0);
        s = list.join();
        break;
      }
    }
    if (s.isEmpty) {
      s = 'Почта не содержит домен';
    }
    //print(s);
    return s;
  }
}

class GeneralUser extends User {
  final String name;
  final int age;

  GeneralUser({required this.name, required this.age, required String email})
      : super(email);
}

class UserManager<T extends User> {
  final List<T> listUser;

  UserManager(this.listUser);

  void addUser(T user) {
    listUser.add(user);
  }

  void deleteUser(T user) {
    listUser.remove(user);
  }

  void showUsers() {
    listUser.forEach((element) {
      //print(element.runtimeType);
      if (element.runtimeType == AdminUser) {
        AdminUser u = element as AdminUser;
        print('${u.name}:${u.rootAccess}:${u.email}');
      } else if (element.runtimeType == GeneralUser) {
        GeneralUser u = element as GeneralUser;
        print('${u.name}:${u.age}:${u.email}');
      } else {
        User u = element as User;
        print('${u.email}');
      }
    });
  }

  void showEmail() {
    listUser.forEach((element) {
      if (element.runtimeType != AdminUser) {
        print(element.email);
      } else {
        print((element as AdminUser).getEmailSystem());
      }
    });
  }
}
