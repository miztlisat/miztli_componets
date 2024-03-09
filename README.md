# Miztli Components

This package provides a collection of reusable components for the Miztli application user interface.

## Features

- Atoms: Individual basic components.
  - `BackGlass`: A component for a glass effect on the background.
  - `Background`: Component for setting the background of the application.
  - `GlassContainer`: A container with a glass effect.
  - `MonitorButton`: A monitoring button to control the application.
  - `StateMission`: A component for visualizing the state of the mission.

- Molecules: More complex components that combine multiple atoms.
  - `ImageCarousel`: A carousel of images to display multiple images.
  - `MissionCountDown`: A countdown timer to show the remaining time of a mission.
  - `MissionTitle`: A component to display the title of the mission.

- Domain Components: Components related to the domain logic of the application.
  - `Settings`: Interface for configuring application settings.
  - `StateMission`: Model to represent the state of a mission.
  - `StateMissionEnum`: Enumerator for possible states of a mission.

## Getting Started

To start using these components in your project, follow these steps:

1. Install the `miztli_components` package by adding it to your `pubspec.yaml`:

    ```yaml
    dependencies:
      miztli_components: ^1.0.0
    ```

2. Import the necessary components in your Dart files:

    ```dart
    import 'package:miztli_components/ui/atoms/back_glass.dart';
    import 'package:miztli_components/ui/molecules/image_carousel.dart';
    // Import other components as needed
    ```

3. Use the components in your application as per the provided documentation.
