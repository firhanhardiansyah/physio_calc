## About this app

Physio Calc / Physiotherapy calculator adalah aplikasi pengukuran fisioterapi yang akan membantu fisioterapis dalam melakukan pemeriksaan pada pasien serta bertujuan untuk meningkatakan akurasi diagnosis fisioterapi.

## Launching your app flavors

Test the setup using `flutter run --flavor dev -t lib/main.dart` at the command line, or in your IDE.

docs: https://docs.flutter.dev/deployment/flavors

### Android

To build apk or appbundle(to publish to the playstore) for each flavor you can use the commands(recommended) instead of using android studio.

### For prod you can use:

- APK

```
flutter build apk --flavor prod -t lib/main_prod.dart
```

- App Bundle

```
flutter build appbundle --flavor prod -t lib/main_prod.dart
```

### For Demo you can use:

- APK

```
flutter build apk --flavor demo -t lib/main_demo.dart
```

- App Bundle

```
flutter build appbundle --flavor demo -t lib/main_demo.dart
```

### For Development you can use:

- APK

```
flutter build apk --flavor dev -t lib/main.dart
```

- App Bundle

```
flutter build appbundle --flavor dev -t lib/main.dart
```

- Sample Create Features 
```
get create page:<feature_name> on modules/features
```

- Build Runner
```
flutter pub run build_runner build --delete-conflicting-outputs
```

- Icon with flavor
- Demo
```
flutter pub run flutter_launcher_icons -f flutter_launcher_icons_demo.yaml
```