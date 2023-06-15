<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Multi Select Container is a Flutter package that provides a customizable container for selecting multiple items from a list. It allows you to easily implement a multi-select feature in your Flutter application.

## Features

* Select multiple items from a list.
* Customize the appearance of the container.
* Easily integrate with existing Flutter projects.
* Support for both iOS and Android platforms.

## Getting started

To start using the package, add the dependencies in your pubspec.yaml and import.

## Usage

```dart
MultiSelectBuilder<String>(builder: (context, controller) {
    return Column(
        children: [
            for(String item in itemList)
                MultiSelectContainer(
                    tag: item,
                    controller: controller,
                    child: const Text(item),
                ),
        ],
    ),
});
```

* `tag`: A unique identifier for the container.
* `controller`: An instance of MultiSelectController to control the selection.
* `child`: The child widget to display within the container.
* `colorOnSelected`: The color to apply when the container is selected.
* `onTap`: A callback function to handle the tap event on the container.
* `elevation`: The elevation of the container card.
* `radius`: The border radius of the container card.
* `widgetOnTop`: An optional widget to display on top of the container.