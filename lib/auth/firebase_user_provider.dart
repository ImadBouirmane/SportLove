import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SportLoveFirebaseUser {
  SportLoveFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

SportLoveFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SportLoveFirebaseUser> sportLoveFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<SportLoveFirebaseUser>(
        (user) => currentUser = SportLoveFirebaseUser(user));