// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccountStore on _AccountStore, Store {
  late final _$userEmailAtom = Atom(
    name: '_AccountStore.userEmail',
    context: context,
  );

  @override
  String? get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String? value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  late final _$userNameAtom = Atom(
    name: '_AccountStore.userName',
    context: context,
  );

  @override
  String? get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String? value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$countryAtom = Atom(
    name: '_AccountStore.country',
    context: context,
  );

  @override
  String? get country {
    _$countryAtom.reportRead();
    return super.country;
  }

  @override
  set country(String? value) {
    _$countryAtom.reportWrite(value, super.country, () {
      super.country = value;
    });
  }

  late final _$birthDateAtom = Atom(
    name: '_AccountStore.birthDate',
    context: context,
  );

  @override
  DateTime? get birthDate {
    _$birthDateAtom.reportRead();
    return super.birthDate;
  }

  @override
  set birthDate(DateTime? value) {
    _$birthDateAtom.reportWrite(value, super.birthDate, () {
      super.birthDate = value;
    });
  }

  late final _$registrationDateAtom = Atom(
    name: '_AccountStore.registrationDate',
    context: context,
  );

  @override
  DateTime? get registrationDate {
    _$registrationDateAtom.reportRead();
    return super.registrationDate;
  }

  @override
  set registrationDate(DateTime? value) {
    _$registrationDateAtom.reportWrite(value, super.registrationDate, () {
      super.registrationDate = value;
    });
  }

  late final _$isLoggedInAtom = Atom(
    name: '_AccountStore.isLoggedIn',
    context: context,
  );

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  late final _$_AccountStoreActionController = ActionController(
    name: '_AccountStore',
    context: context,
  );

  @override
  String? register(String email, String password) {
    final _$actionInfo = _$_AccountStoreActionController.startAction(
      name: '_AccountStore.register',
    );
    try {
      return super.register(email, password);
    } finally {
      _$_AccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? login(String email, String password) {
    final _$actionInfo = _$_AccountStoreActionController.startAction(
      name: '_AccountStore.login',
    );
    try {
      return super.login(email, password);
    } finally {
      _$_AccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateProfile({String? name, String? countryValue, DateTime? birth}) {
    final _$actionInfo = _$_AccountStoreActionController.startAction(
      name: '_AccountStore.updateProfile',
    );
    try {
      return super.updateProfile(
        name: name,
        countryValue: countryValue,
        birth: birth,
      );
    } finally {
      _$_AccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logout() {
    final _$actionInfo = _$_AccountStoreActionController.startAction(
      name: '_AccountStore.logout',
    );
    try {
      return super.logout();
    } finally {
      _$_AccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userEmail: ${userEmail},
userName: ${userName},
country: ${country},
birthDate: ${birthDate},
registrationDate: ${registrationDate},
isLoggedIn: ${isLoggedIn}
    ''';
  }
}
