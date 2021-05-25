class Stats {
  final String? time;
  final int? gas;
  final int? speed;
  final int? gear;
  final int? lean;
  final int? frontBrake;
  final int? rearBrake;

  Stats({
    required this.time,
    required this.gas,
    required this.speed,
    required this.gear,
    required this.lean,
    required this.frontBrake,
    required this.rearBrake,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
        time: json['Time'] as String?,
        gas: json['Gas'] as int?,
        speed: json['Speed'] as int?,
        gear: json['Gear'] as int?,
        lean: json['Lean'] as int?,
        frontBrake: json['Front Brake'] as int?,
        rearBrake: json['Rear Brake'] as int?
    );
  }
}