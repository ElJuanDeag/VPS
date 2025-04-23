FROM cirrusci/flutter:latest

# Install Android SDK & required tools
USER root

RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    unzip \
    curl \
    git \
    bash \
    xz-utils \
    libglu1-mesa \
    lib32stdc++6 \
    lib32z1 \
    adb \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV ANDROID_HOME=/opt/android-sdk
ENV PATH="${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools"

# Install Android Command Line Tools
RUN mkdir -p ${ANDROID_HOME}/cmdline-tools && \
    cd ${ANDROID_HOME}/cmdline-tools && \
    curl -O https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip && \
    unzip commandlinetools-linux-*.zip -d latest && \
    rm commandlinetools-linux-*.zip

# Accept licenses and install platforms
RUN yes | sdkmanager --licenses && \
    sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.2" "emulator"

# Setup non-root user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME && \
    useradd --uid $USER_UID --gid $USER_GID -m $USERNAME && \
    usermod -aG sudo $USERNAME

USER $USERNAME
WORKDIR /home/$USERNAME/app
