#!/bin/bash
# Revanced Extended build
source src/build/utils.sh

# Download requirements
revanced_dl(){
	dl_gh "revanced-patches revanced-integrations revanced-cli" "inotia00" "prerelease"
}

1() {
	revanced_dl
	# Patch YouTube:
	get_patches_key "youtube-revanced-extended"
	version="19.28.42"
	get_apk "com.google.android.youtube" "youtube-alpha" "youtube" "google-inc/youtube/youtube" "Bundle_extract"
	split_editor "youtube-alpha" "youtube-alpha"
	patch "youtube-alpha" "revanced-extended" "inotia"
	# Patch Youtube Arm64-v8a
	get_patches_key "youtube-revanced-extended"
	split_editor "youtube-alpha" "youtube-alpha-arm64-v8a" "exclude" "split_config.armeabi_v7a split_config.x86 split_config.x86_64"
	patch "youtube-alpha-arm64-v8a" "revanced-extended" "inotia"
	# Patch Youtube Armeabi-v7a
	get_patches_key "youtube-revanced-extended"
	split_editor "youtube-alpha" "youtube-alpha-armeabi-v7a" "exclude" "split_config.arm64_v8a split_config.x86 split_config.x86_64"
	patch "youtube-alpha-armeabi-v7a" "revanced-extended" "inotia"
	# Patch Youtube x86
	get_patches_key "youtube-revanced-extended"
	split_editor "youtube-alpha" "youtube-alpha-x86" "exclude" "split_config.arm64_v8a split_config.armeabi_v7a split_config.x86_64"
	patch "youtube-alpha-x86" "revanced-extended" "inotia"
	# Patch Youtube x86_64
	get_patches_key "youtube-revanced-extended"
	split_editor "youtube-alpha" "youtube-alpha-x86_64" "exclude" "split_config.arm64_v8a split_config.armeabi_v7a split_config.x86"
	patch "youtube-alpha-x86_64" "revanced-extended" "inotia"
}
2() {
	revanced_dl
	# Patch YouTube Music Extended:
	# Arm64-v8a
	get_patches_key "youtube-music-revanced-extended"
	version="7.18.52"
	get_apk "com.google.android.apps.youtube.music" "youtube-music-alpha-arm64-v8a" "youtube-music" "google-inc/youtube-music/youtube-music" "arm64-v8a"
	patch "youtube-music-alpha-arm64-v8a" "revanced-extended" "inotia"
	# Armeabi-v7a
	get_patches_key "youtube-music-revanced-extended"
	version="7.18.52"
	get_apk "com.google.android.apps.youtube.music" "youtube-music-alpha-armeabi-v7a" "youtube-music" "google-inc/youtube-music/youtube-music" "armeabi-v7a"
	patch "youtube-music-alpha-armeabi-v7a" "revanced-extended" "inotia"
	# x86
	get_patches_key "youtube-music-revanced-extended"
	version="7.18.52"
	get_apk "com.google.android.apps.youtube.music" "youtube-music-alpha-x86" "youtube-music" "google-inc/youtube-music/youtube-music" "x86"
	patch "youtube-music-alpha-x86" "revanced-extended" "inotia"
	# x86_64
	get_patches_key "youtube-music-revanced-extended"
	version="7.18.52"
	get_apk "com.google.android.apps.youtube.music" "youtube-music-alpha-x86_64" "youtube-music" "google-inc/youtube-music/youtube-music" "x86_64"
	patch "youtube-music-alpha-x86_64" "revanced-extended" "inotia"
}
3() {
	revanced_dl
	version="19.28.42"
	get_apk "com.google.android.youtube" "youtube-lite-alpha" "youtube" "google-inc/youtube/youtube" "Bundle_extract"
	# Patch YouTube Lite Arm64-v8a:
	get_patches_key "youtube-revanced-extended"
	split_editor "youtube-lite-alpha" "youtube-lite-alpha-arm64-v8a" "include" "split_config.arm64_v8a split_config.en split_config.xhdpi split_config.xxxhdpi"
	patch "youtube-lite-alpha-arm64-v8a" "revanced-extended" "inotia"
	# Patch YouTube Lite Armeabi-v7a:
	get_patches_key "youtube-revanced-extended"
	split_editor "youtube-lite-alpha" "youtube-lite-alpha-armeabi-v7a" "include" "split_config.armeabi_v7a split_config.en split_config.xhdpi split_config.xxxhdpi"
	patch "youtube-lite-alpha-armeabi-v7a" "revanced-extended" "inotia"
}
case "$1" in
    1)
        1
        ;;
    2)
        2
        ;;
    3)
        3
        ;;
esac
