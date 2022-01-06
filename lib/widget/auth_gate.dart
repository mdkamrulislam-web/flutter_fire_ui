import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            // showAuthActionSwitch: false,
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  action == AuthAction.signIn
                      ? 'Welcome to FlutterFire UI! Please sign in to continue.'
                      : 'Welcome to FlutterFire UI! Please create an account to continue',
                ),
              );
            },
            footerBuilder: (context, _) {
              return const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'By signing in, you agree to our terms and conditions.',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
            sideBuilder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                      'https://firebase.flutter.dev/img/flutterfire_300x.png'),
                ),
              );
            },
            headerBuilder: (context, constraints, _) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    'https://firebase.flutter.dev/img/flutterfire_300x.png',
                  ),
                ),
              );
            },
            providerConfigs: const [
              EmailProviderConfiguration(),
              PhoneProviderConfiguration(),
              GoogleProviderConfiguration(
                clientId: '1:778935804680:android:d2da33128b67cdc68c42bd',
              ),
              FacebookProviderConfiguration(
                clientId: '...',
              ),
            ],
          );
        }
        return const ProfileScreen(
          providerConfigs: [
            EmailProviderConfiguration(),
            GoogleProviderConfiguration(
              clientId: '1:778935804680:android:d2da33128b67cdc68c42bd',
            ),
            FacebookProviderConfiguration(
              clientId: '...',
            ),
          ],
          avatarSize: 200,
        );
      },
    );
  }
}
