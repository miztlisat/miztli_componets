import 'package:miztli_componets/domain/enums/state_misson.dart';

/// An abstract class representing a state model for a mission.
abstract class StateMissionModel {
  /// Constructs a StateMissionModel with the provided name and state.
  ///
  /// [name] is the name of the state model.
  /// [state] is the mission state associated with the model.
  StateMissionModel({required this.name, required this.state});

  /// The name of the state model.
  final String name;

  /// The mission state associated with the model.
  final StatesMission state;

  /// Returns the icon asset corresponding to the state model.
  ///
  /// Subclasses must implement this method to provide the icon asset.
  String getIcon();
}
