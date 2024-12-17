import 'package:equatable/equatable.dart';

class AzzanModel extends Equatable {
  final String? title;
  final String? query;
  final String? azzanModelFor;
  final int? method;
  final String? prayerMethodName;
  final int? daylight;
  final int? timezone;
  final String? mapImage;
  final String? sealevel;
  final String? link;
  final String? qiblaDirection;
  final String? latitude;
  final String? longitude;
  final String? address;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? country;
  final String? countryCode;
  final List<Item>? items;
  final int? statusValid;
  final int? statusCode;
  final String? statusDescription;

  const AzzanModel({
    this.title,
    this.query,
    this.azzanModelFor,
    this.method,
    this.prayerMethodName,
    this.daylight,
    this.timezone,
    this.mapImage,
    this.sealevel,
    this.link,
    this.qiblaDirection,
    this.latitude,
    this.longitude,
    this.address,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.countryCode,
    this.items,
    this.statusValid,
    this.statusCode,
    this.statusDescription,
  });

  factory AzzanModel.fromJson(Map<String, dynamic> json) => AzzanModel(
        title: json['title'] as String?,
        query: json['query'] as String?,
        azzanModelFor: json['for'] as String?,
        method: json['method'] is int
            ? json['method'] as int?
            : int.tryParse(json['method']?.toString() ?? ''),
        prayerMethodName: json['prayer_method_name'] as String?,
        daylight: json['daylight'] is int
            ? json['daylight'] as int?
            : int.tryParse(json['daylight']?.toString() ?? ''),
        timezone: json['timezone'] is int
            ? json['timezone'] as int?
            : int.tryParse(json['timezone']?.toString() ?? ''),
        mapImage: json['map_image'] as String?,
        sealevel: json['sealevel'] as String?,
        link: json['link'] as String?,
        qiblaDirection: json['qibla_direction'] as String?,
        latitude: json['latitude'] as String?,
        longitude: json['longitude'] as String?,
        address: json['address'] as String?,
        city: json['city'] as String?,
        state: json['state'] as String?,
        postalCode: json['postal_code'] as String?,
        country: json['country'] as String?,
        countryCode: json['country_code'] as String?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        statusValid: json['status_valid'] is int
            ? json['status_valid'] as int?
            : int.tryParse(json['status_valid']?.toString() ?? ''),
        statusCode: json['status_code'] is int
            ? json['status_code'] as int?
            : int.tryParse(json['status_code']?.toString() ?? ''),
        statusDescription: json['status_description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'query': query,
        'for': azzanModelFor,
        'method': method,
        'prayer_method_name': prayerMethodName,
        'daylight': daylight,
        'timezone': timezone,
        'map_image': mapImage,
        'sealevel': sealevel,
        'link': link,
        'qibla_direction': qiblaDirection,
        'latitude': latitude,
        'longitude': longitude,
        'address': address,
        'city': city,
        'state': state,
        'postal_code': postalCode,
        'country': country,
        'country_code': countryCode,
        'items': items?.map((e) => e.toJson()).toList(),
        'status_valid': statusValid,
        'status_code': statusCode,
        'status_description': statusDescription,
      };

  @override
  List<Object?> get props {
    return [
      title,
      query,
      azzanModelFor,
      method,
      prayerMethodName,
      daylight,
      timezone,
      mapImage,
      sealevel,
      link,
      qiblaDirection,
      latitude,
      longitude,
      address,
      city,
      state,
      postalCode,
      country,
      countryCode,
      items,
      statusValid,
      statusCode,
      statusDescription,
    ];
  }
}

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
