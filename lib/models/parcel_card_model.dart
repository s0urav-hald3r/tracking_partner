class ParcelCardModel {
  ParcelCardModel({
    required this.packageIcon,
    required this.trackingNumber,
    required this.carrier,
    required this.parcelName,
    this.estimatedTime,
    this.status,
  });

  final String? packageIcon;
  final String? trackingNumber;
  final String? carrier;
  final String? parcelName;
  final String? estimatedTime;
  final String? status;

  ParcelCardModel copyWith({
    String? packageIcon,
    String? trackingNumber,
    String? carrier,
    String? parcelName,
    String? estimatedTime,
    String? status,
  }) {
    return ParcelCardModel(
      packageIcon: packageIcon ?? this.packageIcon,
      trackingNumber: trackingNumber ?? this.trackingNumber,
      carrier: carrier ?? this.carrier,
      parcelName: parcelName ?? this.parcelName,
      estimatedTime: estimatedTime ?? this.estimatedTime,
      status: status ?? this.status,
    );
  }

  factory ParcelCardModel.fromJson(Map<String, dynamic> json) {
    return ParcelCardModel(
      packageIcon: json["packageIcon"],
      trackingNumber: json["trackingNumber"],
      carrier: json["carrier"],
      parcelName: json["parcelName"],
      estimatedTime: json["estimatedTime"],
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() => {
        "packageIcon": packageIcon,
        "trackingNumber": trackingNumber,
        "carrier": carrier,
        "parcelName": parcelName,
        "estimatedTime": estimatedTime,
        "status": status,
      };
}
