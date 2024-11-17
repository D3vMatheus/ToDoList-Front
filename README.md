# Project Setup and Initialization Guide

This guide will help you set up and initialize the project. Follow these steps carefully to run the web application locally or on an Android emulator.

## Prerequisites

Before you begin, ensure that you have the following installed on your machine:

- [Flutter](https://flutter.dev/docs/get-started/install) (version 2.0 or higher)
- [Android Studio](https://developer.android.com/studio) (optional, for Android emulator)
- A compatible code editor, like [Visual Studio Code](https://code.visualstudio.com/).

## Steps to Initialize the Project

### 1. Install Flutter

Since this project is not running inside a Docker container, you need to have Flutter installed on your system. 

- **Follow the Flutter installation guide**:  
  [Install Flutter](https://flutter.dev/docs/get-started/install)

### 2. Clone the Project

Clone the project to your local machine using Git. Run the following command in your terminal:

```bash
git clone <repository-url>
cd <project-directory>
```
Replace <repository-url> with the actual repository URL, and <project-directory> with the name of the directory that was created after cloning.

### 3. Run the Project on Web
If you want to run the application on a web browser, follow these steps:

3.1 Install Dependencies
Run the following command to install the required dependencies:
```bash
flutter pub get
```
3.2 Run the Application
Once the dependencies are installed, you can run the application by executing:

```bash
flutter run
```
Then select a browser to run the application.

### 4. Run the Project on Android Emulator
If you prefer to run the application on an Android emulator using Android Studio, follow these steps:

4.1 Open the Project in Android Studio
Open Android Studio and click on Open.
Navigate to the project folder and open it.
4.2 Set Up the Emulator
In Android Studio, go to AVD Manager (Android Virtual Device Manager).
Create a new virtual device or select an existing device.
Once the emulator is set up, start the emulator.
4.3 Install Dependencies
Run the following command to install the required dependencies:
```bash
flutter pub get
```
4.4 Run the Application on the Emulator
Once the dependencies are installed and the emulator is running, execute the following command to run the app:
```bash
flutter run
```
