# progress_indicator_plus

A Flutter package that provides customizable progress indicators with additional features.

## Features

- Customizable linear progress indicator with dynamic text color contrast.
- Text color dynamically changes to ensure visibility, even if the progress is in the middle of the text.
- Easily change the height, padding, colors, and other properties.
- Supports custom decorations and gradients.

## Getting started

To use this package, add `progress_indicator_plus` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  progress_indicator_plus: ^0.0.3
```

## Usage

Here is a simple example of how to use the `LinearProgressIndicatorPlus` widget:

```dart
import 'package:flutter/material.dart';
import 'package:progress_indicator_plus/linear_progress_indicator_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Progress Indicator Plus Example')),
        body: Center(
          child: LinearProgressIndicatorPlus(
            value: 0.7,
            text: '70%',
            height: 40,
            padding: 8,
            backgroundColor: Colors.grey[300],
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
```

## Examples

### Text on Background

![Text on Background](https://github.com/mostafaemara/progress_indicator_plus/blob/main/resources/1.png?raw=true)

### Text Half on Background and Half on Progress Color

![Text Half on Background and Half on Progress Color](https://github.com/mostafaemara/progress_indicator_plus/blob/main/resources/2.png?raw=true)

### Text on Progress Color

![Text on Progress Color](https://github.com/mostafaemara/progress_indicator_plus/blob/main/resources/3.png?raw=true)
