run_app:
	flutter run --target lib/main.dart

build_apk:
	 flutter build apk --target lib/main.dart --obfuscate --split-debug-info=secure_minna

build_release_apk:
	 flutter build apk --release --target lib/main.dart --obfuscate --split-debug-info=secure_minna

build_release_apk_aab:
	 flutter build appbundle --target lib/main.dart --obfuscate --split-debug-info=secure_minna

shorebird_release_android:
	 shorebird release android --target lib/main.dart -- --obfuscate --split-debug-info=secure_minna

shorebird_patch_android:
	 shorebird patch android --target lib/main.dart -- --obfuscate --split-debug-info=secure_minna

shorebird_preview_android:
	 shorebird preview --app-id 5f9269bb-977f-4300-8c65-5c0e0e0196ba
	 