import 'dart:convert';

List<ChartSampleData> chartSampleDataFromJson(String str) =>
    List<ChartSampleData>.from(
        json.decode(str).map((x) => ChartSampleData.fromJson(x)));

String chartSampleDataToJson(List<ChartSampleData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChartSampleData {
  ChartSampleData({
    required this.date,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volumeLtc,
    required this.volumeUsd,
  });

  DateTime date;
  double open;
  double high;
  double low;
  double close;
  double volumeLtc;
  double volumeUsd;

  factory ChartSampleData.fromJson(Map<String, dynamic> json) =>
      ChartSampleData(
        date: DateTime.parse(json["date"]),
        open: json["open"].toDouble(),
        high: json["high"].toDouble(),
        low: json["low"].toDouble(),
        close: json["close"].toDouble(),
        volumeLtc: json["volume_ltc"].toDouble(),
        volumeUsd: json["volume_usd"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "open": open,
        "high": high,
        "low": low,
        "close": close,
        "volume_ltc": volumeLtc,
        "volume_usd": volumeUsd,
      };
}
