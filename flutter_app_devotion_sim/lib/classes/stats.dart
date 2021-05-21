class Stats {
  final String time;
  final double gas;
  final double speed;
  final double gear;
  final double lean;
  final double frontBrake;
  final double rearBrake;

  Stats({
    this.time,
    this.gas,
    this.speed,
    this.gear,
    this.lean,
    this.frontBrake,
    this.rearBrake,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
        time: json['Time'] as String,
        gas: json['Gas'] as double,
        speed: json['Speed'] as double,
        gear: json['Gear'] as double,
        lean: json['Lean'] as double,
        frontBrake: json['Front Brake'] as double,
        rearBrake: json['Rear Brake'] as double
    );
  }
}