library miztli_componets.domain.enums.state_mission;
/// An enumeration representing different states of a mission.
enum StatesMission {
  /// Waiting for launch.
  launchWait,

  /// Ascent phase of the mission.
  ascent,

  /// Rocket separation phase of the mission.
  rocketSeparation,

  /// Descent phase of the mission.
  descent,

  /// High-speed release phase of the mission.
  hsRelease,

  /// Landed state of the mission.
  landed,
}
