import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userLogged = StateProvider((ref) => FirebaseAuth.instance.currentUser);
final userToken = StateProvider((ref) => '');
final forceReload = StateProvider((ref) => false);

//booking
final currentStep = StateProvider((ref) => 1);
final selectedCity = StateProvider((ref) => '');
final selectedDoctor = StateProvider((ref) => '');
