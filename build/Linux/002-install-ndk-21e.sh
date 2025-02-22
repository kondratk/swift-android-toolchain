#!/bin/bash

cd $HOME

for version in 21e
do
    ndk=android-ndk-r$version
    ndk_zip=$ndk-linux-x86_64.zip

    wget --progress=bar:force https://dl.google.com/android/repository/$ndk_zip

    unzip $ndk_zip -x \
        "$ndk/toolchains/mips64el-linux-android-4.9*" \
        "$ndk/toolchains/mipsel-linux-android-4.9*" \
        \
        "$ndk/platforms/android-9*" \
        "$ndk/platforms/android-12*" \
        "$ndk/platforms/android-13*" \
        "$ndk/platforms/android-14*" \
        "$ndk/platforms/android-15*" \
        "$ndk/platforms/android-16*" \
        "$ndk/platforms/android-17*" \
        "$ndk/platforms/android-18*" \
        "$ndk/platforms/android-19*" \
        "$ndk/platforms/android-22*" \
        "$ndk/platforms/android-23*" \
        "$ndk/platforms/android-24*" \
        "$ndk/platforms/android-25*" \
        "$ndk/platforms/android-26*" \
        "$ndk/platforms/android-27*" \
        "$ndk/platforms/android-28*" \
        "$ndk/platforms/android-29*" \
        "$ndk/platforms/android-30*" > /dev/null

    rm $ndk_zip
done

# libatomic >_<
cp "$ndk/toolchains/llvm/prebuilt/linux-x86_64/aarch64-linux-android/lib64/libatomic.a" "$ndk/toolchains/llvm/prebuilt/linux-x86_64/lib/gcc/aarch64-linux-android/4.9.x"
cp "$ndk/toolchains/llvm/prebuilt/linux-x86_64/x86_64-linux-android/lib64/libatomic.a" "$ndk/toolchains/llvm/prebuilt/linux-x86_64/lib/gcc/x86_64-linux-android/4.9.x"
cp "$ndk/toolchains/llvm/prebuilt/linux-x86_64/arm-linux-androideabi/lib/libatomic.a" "$ndk/toolchains/llvm/prebuilt/linux-x86_64/lib/gcc/arm-linux-androideabi/4.9.x"
cp "$ndk/toolchains/llvm/prebuilt/linux-x86_64/i686-linux-android/lib/libatomic.a" "$ndk/toolchains/llvm/prebuilt/linux-x86_64/lib/gcc/i686-linux-android/4.9.x"

# exports
echo "export ANDROID_NDK21=\$HOME/android-ndk-r21e" >> .build_env
echo "export ANDROID_NDK=\$ANDROID_NDK21" >> .build_env
echo "export ANDROID_NDK_HOME=\$ANDROID_NDK21" >> .build_env