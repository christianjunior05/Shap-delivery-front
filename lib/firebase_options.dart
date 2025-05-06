import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // Ces valeurs doivent être remplacées par vos propres valeurs de configuration Firebase
    return const FirebaseOptions(
      apiKey: 'votre-api-key',
      appId: 'votre-app-id',
      messagingSenderId: 'votre-messaging-sender-id',
      projectId: 'votre-project-id',
      authDomain: 'votre-auth-domain',
      storageBucket: 'votre-storage-bucket',
    );
  }
}
