# tic_tac_toe
Tic tac toe game with firebase integrations.

## Getting Started

In order to use this project go ahead and download the following:

- [Flutter 3.7+](https://docs.flutter.dev/development/tools/sdk/releases)
- [Dart SDK 2.19+](https://docs.flutter.dev/development/tools/sdk/releases)
- [FlutterFire Cli](https://firebase.flutter.dev/docs/cli/)

Before getting started you will need to create a firebase account and in the build section you will 
need to create a Firestore database. Once a test database has been created you can move on to setting up the auth to get into the app.

In the Authentication section on firebase go to sign-in-method and select the google sign in. 
Once you did this go to the settings for the sign in method and get the `client id`.
After this is done replace the text section noting `client id` in the `auth_repository.dart` file of the project.

After downloading the above tools for development you will need to run `flutterfire login` once you created a firebase account. 
After logging in to your account, in the root of the project, run `flutterfire configure`.

Once all this is complete the required files will have been generated and you can run the app:
`flutter pub get`
`flutter run`
