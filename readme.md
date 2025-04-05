/my_flutter_app
 ├── /apps
 │   ├── /main_app
 │   │   ├── /lib
 │   │   │   ├── main.dart
 │   │   │   ├── app.dart
 │   │   │   ├── router.dart
 │   │   │   └── di.dart
 │   │   └── pubspec.yaml
 │   └── /admin_app
 │       ├── /lib
 │       └── pubspec.yaml
 ├── /packages
 │   ├── /core
 │   │   ├── /lib
 │   │   │   ├── /network
 │   │   │   │   ├── api_client.dart
 │   │   │   │   ├── dio_interceptor.dart
 │   │   │   │   └── retrofit_service.dart
 │   │   │   ├── /di
 │   │   │   │   └── service_locator.dart
 │   │   │   ├── /utils
 │   │   │   │   ├── extensions.dart
 │   │   │   │   └── constants.dart
 │   │   │   └── core.dart
 │   │   └── pubspec.yaml
 │   ├── /feature_auth
 │   │   ├── /lib
 │   │   │   ├── /data
 │   │   │   │   ├── auth_repository.dart
 │   │   │   │   └── models.dart
 │   │   │   ├── /presentation
 │   │   │   │   ├── login_page.dart
 │   │   │   │   └── signup_page.dart
 │   │   │   ├── /bloc
 │   │   │   │   ├── auth_bloc.dart
 │   │   │   │   ├── auth_event.dart
 │   │   │   │   └── auth_state.dart
 │   │   │   └── feature_auth.dart
 │   │   └── pubspec.yaml
 │   └── /localization
 │       ├── /lib
 │       │   ├── messages.i69n.dart
 │       │   └── localization.dart
 │       └── pubspec.yaml
 ├── melos.yaml
 ├── pubspec.yaml
 └── analysis_options.yaml

melos 6.3.2.
dart pub global activate melos
melos init
melos bootstrap
flutter pub add flutter_bloc get_it injectable auto_route flow_builder freezed json_serializable retrofit dio i69n bdd_widget_test build_runner
flutter create apps/moviedb
flutter create --template=package packages/network_service

https://app.quicktype.io/?l=dart
flutter pub run build_runner watch --delete-conflicting-outputs
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub add freezed_annotation
dart run build_runner watch -d
