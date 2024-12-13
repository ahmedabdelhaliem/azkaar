import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String? dateFor;
  final String? fajr;
  final String? shurooq;
  final String? dhuhr;
  final String? asr;
  final String? maghrib;
  final String? isha;

  const Item({
    this.dateFor,
    this.fajr,
    this.shurooq,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        dateFor: json['date_for'] as String?,
        fajr: json['fajr'] as String?,
        shurooq: json['shurooq'] as String?,
        dhuhr: json['dhuhr'] as String?,
        asr: json['asr'] as String?,
        maghrib: json['maghrib'] as String?,
        isha: json['isha'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'date_for': dateFor,
        'fajr': fajr,
        'shurooq': shurooq,
        'dhuhr': dhuhr,
        'asr': asr,
        'maghrib': maghrib,
        'isha': isha,
      };

  @override
  List<Object?> get props {
    return [
      dateFor,
      fajr,
      shurooq,
      dhuhr,
      asr,
      maghrib,
      isha,
    ];
  }
}
