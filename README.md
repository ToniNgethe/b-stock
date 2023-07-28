<p align="center">
  <img src="assets/icon/ic_icon.png" width="160">
</p>

<h1 align="center">B-Stocks</h1>
<h3 align="center">A Simple stocks application for both android and iOS.</h3>

<p align="center">
  <a href="https://play.google.com/store/apps/details?id=co.bstock">
    <img src="https://img.shields.io/badge/Google-PlayStore-green.svg?style=for-the-badge">
  </a>
</p>

### About the project

Welcome to B-stocks, the stunning application created with Flutter! Our primary goal is to provide you with company stock information.

To make this possible, we fetch the stock data from  [marketstack](https://api.marketstack.com/), a reliable service that offers both free and paid plans. To get started, simply visit their website and obtain an API key.

We take pride in building this project with the powerful [Flutter](https://flutter.io/) framework, enabling us to develop a single codebase that runs seamlessly on mobile, desktop, and web platforms.

Feel free to explore B-stocks and stay updated with stock market trends! If you have any questions or feedback, i'm here to help. Happy investing!

<img src="screenshots/screenshot.png" alt="alt text">



## Features

- **Latest Stock Data**: Stay informed with up-to-date company stock data, allowing you to make well-informed investment decisions.
- **Date Range Filter**: Easily customize your stock data view by selecting specific date ranges, helping you analyze trends over time.
- **Completely Free**: We take pride in offering our app completely free of charge. No paid plans required – access all features with no limitations.
- **Autocomplete Search**: My app boasts an autocomplete search functionality, making it effortless to find and track stocks for your preferred companies.
- **Offline Functionality**: Stay connected to your stock data even without an internet connection. Our app is designed with an "offline first" approach, ensuring you can access essential information anytime, anywhere.
- **Add Custom Companies**: At the moment you can view stock from a defined list of companies. A feature to add companies is still in development


## Folder structure

All the code is under the lib folder, which contains 3 major folders

* **core**: contains the app business and reusable functionalities eg API connection, local database.
* **features**: This contains the app features, splash page, select company, view stocks etc.
* **app**: this contains the apps utils eg themes, di etc.

## Development environment setup

First, clone the repository with the 'clone' command

Then, download either Android Studio or Visual Studio Code, with their respective [Flutter editor plugins](https://flutter.io/get-started/editor/). For more information about Flutter installation procedure, check the [official install guide](https://flutter.io/get-started/install/).

Install dependencies from pubspec.yaml by running `flutter packages get` from the project root (see [using packages documentation](https://flutter.io/using-packages/#adding-a-package-dependency-to-an-app) for details and how to do this in the editor).

## Building the project

Before building and running the project, do the following:
- Obtain an API KEY from [marketstack](https://api.marketstack.com/).
- Create a .env file under the root folder. Add the following:
  ```
    API_KEY='{Your api key}'
  ```
- Open your terminal and run the following command to generate build files.
  ```
  flutter packages pub run build_runner build --delete-conflicting-outputs
  ```
  Or simply run the generate.sh file in the root folder
- Use the following command to run the app
    ```
    flutter run lib/main.dart
    ```
  Thats it, you are good to go.


 ## Tests
I have written several tests to verify the app's logic. You can simply run the tests using
    ```
    flutter test
    ```

That's it, enjoy
