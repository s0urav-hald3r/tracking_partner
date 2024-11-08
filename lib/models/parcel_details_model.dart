class ParcelDetailsModel {
  ParcelDetailsModel({
    required this.uuid,
    required this.shipments,
    required this.done,
    required this.fromCache,
  });

  final String? uuid;
  final List<Shipment> shipments;
  final bool? done;
  final bool? fromCache;

  factory ParcelDetailsModel.fromJson(Map<String, dynamic> json) {
    return ParcelDetailsModel(
      uuid: json["uuid"],
      shipments: json["shipments"] == null
          ? []
          : List<Shipment>.from(
              json["shipments"]!.map((x) => Shipment.fromJson(x))),
      done: json["done"],
      fromCache: json["fromCache"],
    );
  }

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "shipments": shipments.map((x) => x.toJson()).toList(),
        "done": done,
        "fromCache": fromCache,
      };
}

class Shipment {
  Shipment({
    required this.states,
    required this.destination,
    required this.carriers,
    required this.externalTracking,
    required this.status,
    required this.destinationCode,
    required this.services,
    required this.trackingId,
    required this.detectedCarrier,
    required this.lastState,
    required this.attributes,
  });

  final List<State> states;
  final String? destination;
  final List<String> carriers;
  final List<ExternalTracking> externalTracking;
  final String? status;
  final String? destinationCode;
  final List<DetectedCarrier> services;
  final String? trackingId;
  final DetectedCarrier? detectedCarrier;
  final State? lastState;
  final List<Attribute> attributes;

  factory Shipment.fromJson(Map<String, dynamic> json) {
    return Shipment(
      states: json["states"] == null
          ? []
          : List<State>.from(json["states"]!.map((x) => State.fromJson(x))),
      destination: json["destination"],
      carriers: json["carriers"] == null
          ? []
          : List<String>.from(json["carriers"]!.map((x) => x)),
      externalTracking: json["externalTracking"] == null
          ? []
          : List<ExternalTracking>.from(json["externalTracking"]!
              .map((x) => ExternalTracking.fromJson(x))),
      status: json["status"],
      destinationCode: json["destinationCode"],
      services: json["services"] == null
          ? []
          : List<DetectedCarrier>.from(
              json["services"]!.map((x) => DetectedCarrier.fromJson(x))),
      trackingId: json["trackingId"],
      detectedCarrier: json["detectedCarrier"] == null
          ? null
          : DetectedCarrier.fromJson(json["detectedCarrier"]),
      lastState:
          json["lastState"] == null ? null : State.fromJson(json["lastState"]),
      attributes: json["attributes"] == null
          ? []
          : List<Attribute>.from(
              json["attributes"]!.map((x) => Attribute.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "states": states.map((x) => x.toJson()).toList(),
        "destination": destination,
        "carriers": carriers.map((x) => x).toList(),
        "externalTracking": externalTracking.map((x) => x.toJson()).toList(),
        "status": status,
        "destinationCode": destinationCode,
        "services": services.map((x) => x.toJson()).toList(),
        "trackingId": trackingId,
        "detectedCarrier": detectedCarrier?.toJson(),
        "lastState": lastState?.toJson(),
        "attributes": attributes.map((x) => x.toJson()).toList(),
      };
}

class Attribute {
  Attribute({
    required this.l,
    required this.val,
    required this.code,
  });

  final String? l;
  final String? val;
  final String? code;

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      l: json["l"],
      val: json["val"],
      code: json["code"],
    );
  }

  Map<String, dynamic> toJson() => {
        "l": l,
        "val": val,
        "code": code,
      };
}

class DetectedCarrier {
  DetectedCarrier({
    required this.slug,
    required this.name,
  });

  final String? slug;
  final String? name;

  factory DetectedCarrier.fromJson(Map<String, dynamic> json) {
    return DetectedCarrier(
      slug: json["slug"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
      };
}

class ExternalTracking {
  ExternalTracking({
    required this.slug,
    required this.url,
    required this.method,
    required this.title,
  });

  final String? slug;
  final String? url;
  final String? method;
  final String? title;

  factory ExternalTracking.fromJson(Map<String, dynamic> json) {
    return ExternalTracking(
      slug: json["slug"],
      url: json["url"],
      method: json["method"],
      title: json["title"],
    );
  }

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "url": url,
        "method": method,
        "title": title,
      };
}

class State {
  State({
    required this.location,
    required this.date,
    required this.carrier,
    required this.status,
  });

  final String? location;
  final DateTime? date;
  final int? carrier;
  final String? status;

  factory State.fromJson(Map<String, dynamic> json) {
    return State(
      location: json["location"],
      date: DateTime.tryParse(json["date"] ?? ""),
      carrier: json["carrier"],
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() => {
        "location": location,
        "date": date?.toIso8601String(),
        "carrier": carrier,
        "status": status,
      };
}
