import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:capstone/schedule/screen/home_screen.dart';
// import 'path_to_auth_service/auth_service.dart'; // Adjust the path accordingly


class AuthService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    // 사용자의 인증 상태 변화를 감지하고 상태를 업데이트합니다.
    user.bindStream(_auth.authStateChanges());
  }

  Future<void> signInAnonymously() async {
    try {
      await _auth.signInAnonymously();
    } catch (e) {
      print('Anonymous login failed: $e');
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount == null) return;

      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final OAuthCredential googleAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await _auth.signInWithCredential(googleAuthCredential);

      // 로그인 성공 후 사용자 정보를 Firestore에 저장
      User? user = _auth.currentUser;
      if (user != null) {
        await saveUserData(user);
      }

      // MainPage로 이동
      Get.to(() => MainPage());
    } catch (e) {
      print('Google login failed: $e');
    }
  }

  Future<void> saveUserData(User user) async {
    // Firestore의 'users' 컬렉션에 사용자 정보 저장
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.doc(user.uid).set({
      'uid': user.uid,
      'displayName': user.displayName,
      // 다른 사용자 정보도 필요한 경우 여기에 추가
    });
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

class LoginPage extends StatelessWidget {
  final AuthService authController = Get.put(AuthService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await authController.signInAnonymously();
                // 익명 로그인 성공 후 MainPage로 이동
                Get.to(() => MainPage());
              },
              child: Text('Anonymous Login'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await authController.signInWithGoogle();
                // 구글 로그인 성공 후 MainPage로 이동
                Get.to(() => MainPage());
              },
              child: Text('Google Login'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthService authController = Get.put(AuthService());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginPage(),
    );
  }
}
