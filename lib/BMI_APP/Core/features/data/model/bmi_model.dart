class BmiModel {
  const BmiModel({
    required this.status,
    this.message,
    this.data,
  });

  final String status;
  final String? message;
  final Map<String, dynamic>? data;

  factory BmiModel.fromJson(Map<String, dynamic> json) {
    return BmiModel(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }
}
