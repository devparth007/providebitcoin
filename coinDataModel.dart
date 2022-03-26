import 'dart:convert';

GetCoinData getCoinDataFromJson(String str) =>
    GetCoinData.fromJson(json.decode(str));

class GetCoinData {
  GetCoinData({
    required this.message,
    required this.type,
    required this.metaData,
    required this.sponsoredData,
    required this.data,
    required this.rateLimit,
    required this.hasWarning,
  });

  String message;
  int type;
  MetaData metaData;
  List<dynamic> sponsoredData;
  List<Datum> data;
  RateLimit rateLimit;
  bool hasWarning;

  factory GetCoinData.fromJson(Map<String, dynamic> json) => GetCoinData(
        message: json["Message"],
        type: json["Type"],
        metaData: MetaData.fromJson(json["MetaData"]),
        sponsoredData: List<dynamic>.from(json["SponsoredData"].map((x) => x)),
        rateLimit: RateLimit.fromJson(json["RateLimit"]),
        hasWarning: json["HasWarning"],
        data: [],
      );
}

class Datum {
  Datum({
    required this.coinInfo,
    required this.raw,
    required this.display,
  });

  CoinInfo coinInfo;
  Raw raw;
  Display display;
}

class CoinInfo {
  CoinInfo({
    required this.id,
    required this.name,
    required this.fullName,
    required this.internal,
    required this.imageUrl,
    required this.url,
    required this.algorithm,
    required this.proofType,
    required this.rating,
    required this.netHashesPerSecond,
    required this.blockNumber,
    required this.blockTime,
    required this.blockReward,
    required this.assetLaunchDate,
    required this.maxSupply,
    required this.type,
  });

  String id;
  String name;
  String fullName;
  String internal;
  String imageUrl;
  String url;
  String algorithm;
  String proofType;
  Rating rating;
  double netHashesPerSecond;
  int blockNumber;
  double blockTime;
  double blockReward;
  String assetLaunchDate;
  double maxSupply;
  int type;

  factory CoinInfo.fromJson(Map<String, dynamic> json) => CoinInfo(
        id: json["Id"],
        name: json["Name"],
        fullName: json["FullName"],
        internal: json["Internal"],
        imageUrl: json["ImageUrl"],
        url: json["Url"],
        algorithm: json["Algorithm"],
        proofType: json["ProofType"],
        rating: Rating.fromJson(json["Rating"]),
        netHashesPerSecond: json["NetHashesPerSecond"].toDouble(),
        blockNumber: json["BlockNumber"],
        blockTime: json["BlockTime"].toDouble(),
        blockReward: json["BlockReward"].toDouble(),
        assetLaunchDate: json["AssetLaunchDate"],
        maxSupply: json["MaxSupply"].toDouble(),
        type: json["Type"],
      );
}

class Rating {
  Rating({
    required this.weiss,
  });

  Weiss weiss;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        weiss: Weiss.fromJson(json["Weiss"]),
      );

  Map<String, dynamic> toJson() => {
        "Weiss": weiss.toJson(),
      };
}

class Weiss {
  Weiss({
    required this.rating,
    required this.technologyAdoptionRating,
    required this.marketPerformanceRating,
  });

  String rating;
  String technologyAdoptionRating;
  String marketPerformanceRating;

  factory Weiss.fromJson(Map<String, dynamic> json) => Weiss(
        rating: json["Rating"],
        technologyAdoptionRating: json["TechnologyAdoptionRating"],
        marketPerformanceRating: json["MarketPerformanceRating"],
      );

  Map<String, dynamic> toJson() => {
        "Rating": rating,
        "TechnologyAdoptionRating": technologyAdoptionRating,
        "MarketPerformanceRating": marketPerformanceRating,
      };
}

class Display {
  Display({
    required this.usd,
  });

  DisplayUsd usd;

  factory Display.fromJson(Map<String, dynamic> json) => Display(
        usd: DisplayUsd.fromJson(json["USD"]),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd.toJson(),
      };
}

class DisplayUsd {
  DisplayUsd({
    required this.fromsymbol,
    required this.price,
    required this.lastvolume,
    required this.lastvolumeto,
    required this.lasttradeid,
    required this.volumeday,
    required this.volumedayto,
    required this.volume24Hour,
    required this.volume24Hourto,
    required this.openday,
    required this.highday,
    required this.lowday,
    required this.open24Hour,
    required this.high24Hour,
    required this.low24Hour,
    required this.lastmarket,
    required this.volumehour,
    required this.volumehourto,
    required this.openhour,
    required this.highhour,
    required this.lowhour,
    required this.toptiervolume24Hour,
    required this.toptiervolume24Hourto,
    required this.change24Hour,
    required this.changepct24Hour,
    required this.changeday,
    required this.changepctday,
    required this.changehour,
    required this.changepcthour,
    required this.supply,
    required this.mktcap,
    required this.circulatingsupply,
    required this.circulatingsupplymktcap,
    required this.totalvolume24H,
    required this.totalvolume24Hto,
    required this.totaltoptiervolume24H,
    required this.totaltoptiervolume24Hto,
    required this.imageurl,
  });

  String fromsymbol;
  String price;
  String lastvolume;
  String lastvolumeto;
  String lasttradeid;
  String volumeday;
  String volumedayto;
  String volume24Hour;
  String volume24Hourto;
  String openday;
  String highday;
  String lowday;
  String open24Hour;
  String high24Hour;
  String low24Hour;
  String lastmarket;
  String volumehour;
  String volumehourto;
  String openhour;
  String highhour;
  String lowhour;
  String toptiervolume24Hour;
  String toptiervolume24Hourto;
  String change24Hour;
  String changepct24Hour;
  String changeday;
  String changepctday;
  String changehour;
  String changepcthour;
  String supply;
  String mktcap;
  String circulatingsupply;
  String circulatingsupplymktcap;
  String totalvolume24H;
  String totalvolume24Hto;
  String totaltoptiervolume24H;
  String totaltoptiervolume24Hto;
  String imageurl;

  factory DisplayUsd.fromJson(Map<String, dynamic> json) => DisplayUsd(
        fromsymbol: json["FROMSYMBOL"],
        price: json["PRICE"],
        lastvolume: json["LASTVOLUME"],
        lastvolumeto: json["LASTVOLUMETO"],
        lasttradeid: json["LASTTRADEID"],
        volumeday: json["VOLUMEDAY"],
        volumedayto: json["VOLUMEDAYTO"],
        volume24Hour: json["VOLUME24HOUR"],
        volume24Hourto: json["VOLUME24HOURTO"],
        openday: json["OPENDAY"],
        highday: json["HIGHDAY"],
        lowday: json["LOWDAY"],
        open24Hour: json["OPEN24HOUR"],
        high24Hour: json["HIGH24HOUR"],
        low24Hour: json["LOW24HOUR"],
        lastmarket: json["LASTMARKET"],
        volumehour: json["VOLUMEHOUR"],
        volumehourto: json["VOLUMEHOURTO"],
        openhour: json["OPENHOUR"],
        highhour: json["HIGHHOUR"],
        lowhour: json["LOWHOUR"],
        toptiervolume24Hour: json["TOPTIERVOLUME24HOUR"],
        toptiervolume24Hourto: json["TOPTIERVOLUME24HOURTO"],
        change24Hour: json["CHANGE24HOUR"],
        changepct24Hour: json["CHANGEPCT24HOUR"],
        changeday: json["CHANGEDAY"],
        changepctday: json["CHANGEPCTDAY"],
        changehour: json["CHANGEHOUR"],
        changepcthour: json["CHANGEPCTHOUR"],
        supply: json["SUPPLY"],
        mktcap: json["MKTCAP"],
        circulatingsupply: json["CIRCULATINGSUPPLY"],
        circulatingsupplymktcap: json["CIRCULATINGSUPPLYMKTCAP"],
        totalvolume24H: json["TOTALVOLUME24H"],
        totalvolume24Hto: json["TOTALVOLUME24HTO"],
        totaltoptiervolume24H: json["TOTALTOPTIERVOLUME24H"],
        totaltoptiervolume24Hto: json["TOTALTOPTIERVOLUME24HTO"],
        imageurl: json["IMAGEURL"],
      );

  Map<String, dynamic> toJson() => {
        "FROMSYMBOL": fromsymbol,
        "PRICE": price,
        "LASTVOLUME": lastvolume,
        "LASTVOLUMETO": lastvolumeto,
        "LASTTRADEID": lasttradeid,
        "VOLUMEDAY": volumeday,
        "VOLUMEDAYTO": volumedayto,
        "VOLUME24HOUR": volume24Hour,
        "VOLUME24HOURTO": volume24Hourto,
        "OPENDAY": openday,
        "HIGHDAY": highday,
        "LOWDAY": lowday,
        "OPEN24HOUR": open24Hour,
        "HIGH24HOUR": high24Hour,
        "LOW24HOUR": low24Hour,
        "LASTMARKET": lastmarket,
        "VOLUMEHOUR": volumehour,
        "VOLUMEHOURTO": volumehourto,
        "OPENHOUR": openhour,
        "HIGHHOUR": highhour,
        "LOWHOUR": lowhour,
        "TOPTIERVOLUME24HOUR": toptiervolume24Hour,
        "TOPTIERVOLUME24HOURTO": toptiervolume24Hourto,
        "CHANGE24HOUR": change24Hour,
        "CHANGEPCT24HOUR": changepct24Hour,
        "CHANGEDAY": changeday,
        "CHANGEPCTDAY": changepctday,
        "CHANGEHOUR": changehour,
        "CHANGEPCTHOUR": changepcthour,
        "SUPPLY": supply,
        "MKTCAP": mktcap,
        "CIRCULATINGSUPPLY": circulatingsupply,
        "CIRCULATINGSUPPLYMKTCAP": circulatingsupplymktcap,
        "TOTALVOLUME24H": totalvolume24H,
        "TOTALVOLUME24HTO": totalvolume24Hto,
        "TOTALTOPTIERVOLUME24H": totaltoptiervolume24H,
        "TOTALTOPTIERVOLUME24HTO": totaltoptiervolume24Hto,
        "IMAGEURL": imageurl,
      };
}

class Raw {
  Raw({
    required this.usd,
  });

  RawUsd usd;

  factory Raw.fromJson(Map<String, dynamic> json) => Raw(
        usd: RawUsd.fromJson(json["USD"]),
      );
}

class RawUsd {
  RawUsd(
      {required this.type,
      required this.fromsymbol,
      required this.flags,
      required this.price,
      required this.lastupdate,
      required this.median,
      required this.lastvolume,
      required this.lastvolumeto,
      required this.lasttradeid,
      required this.volumeday,
      required this.volumedayto,
      required this.volume24Hour,
      required this.volume24Hourto,
      required this.openday,
      required this.highday,
      required this.lowday,
      required this.open24Hour,
      required this.high24Hour,
      required this.low24Hour,
      required this.lastmarket,
      required this.volumehour,
      required this.volumehourto,
      required this.openhour,
      required this.highhour,
      required this.lowhour,
      required this.toptiervolume24Hour,
      required this.toptiervolume24Hourto,
      required this.change24Hour,
      required this.changepct24Hour,
      required this.changeday,
      required this.changepctday,
      required this.changehour,
      required this.changepcthour,
      required this.supply,
      required this.mktcap,
      required this.mktcappenalty,
      required this.circulatingsupply,
      required this.circulatingsupplymktcap,
      required this.totalvolume24H,
      required this.totalvolume24Hto,
      required this.totaltoptiervolume24H,
      required this.totaltoptiervolume24Hto,
      required this.imageurl,
      requiredrequired});

  String type;
  String fromsymbol;
  String flags;
  double price;
  int lastupdate;
  double median;
  double lastvolume;
  double lastvolumeto;
  String lasttradeid;
  double volumeday;
  double volumedayto;
  double volume24Hour;
  double volume24Hourto;
  double openday;
  double highday;
  double lowday;
  double open24Hour;
  double high24Hour;
  double low24Hour;
  String lastmarket;
  double volumehour;
  double volumehourto;
  double openhour;
  double highhour;
  double lowhour;
  double toptiervolume24Hour;
  double toptiervolume24Hourto;
  double change24Hour;
  double changepct24Hour;
  double changeday;
  double changepctday;
  double changehour;
  double changepcthour;
  double supply;
  double mktcap;
  int mktcappenalty;
  double circulatingsupply;
  double circulatingsupplymktcap;
  double totalvolume24H;
  double totalvolume24Hto;
  double totaltoptiervolume24H;
  double totaltoptiervolume24Hto;
  String imageurl;

  factory RawUsd.fromJson(Map<String, dynamic> json) => RawUsd(
        type: json["TYPE"],
        fromsymbol: json["FROMSYMBOL"],
        flags: json["FLAGS"],
        price: json["PRICE"].toDouble(),
        lastupdate: json["LASTUPDATE"],
        median: json["MEDIAN"].toDouble(),
        lastvolume: json["LASTVOLUME"].toDouble(),
        lastvolumeto: json["LASTVOLUMETO"].toDouble(),
        lasttradeid: json["LASTTRADEID"],
        volumeday: json["VOLUMEDAY"].toDouble(),
        volumedayto: json["VOLUMEDAYTO"].toDouble(),
        volume24Hour: json["VOLUME24HOUR"].toDouble(),
        volume24Hourto: json["VOLUME24HOURTO"].toDouble(),
        openday: json["OPENDAY"].toDouble(),
        highday: json["HIGHDAY"].toDouble(),
        lowday: json["LOWDAY"].toDouble(),
        open24Hour: json["OPEN24HOUR"].toDouble(),
        high24Hour: json["HIGH24HOUR"].toDouble(),
        low24Hour: json["LOW24HOUR"].toDouble(),
        lastmarket: json["LASTMARKET"],
        volumehour: json["VOLUMEHOUR"].toDouble(),
        volumehourto: json["VOLUMEHOURTO"].toDouble(),
        openhour: json["OPENHOUR"].toDouble(),
        highhour: json["HIGHHOUR"].toDouble(),
        lowhour: json["LOWHOUR"].toDouble(),
        toptiervolume24Hour: json["TOPTIERVOLUME24HOUR"].toDouble(),
        toptiervolume24Hourto: json["TOPTIERVOLUME24HOURTO"].toDouble(),
        change24Hour: json["CHANGE24HOUR"].toDouble(),
        changepct24Hour: json["CHANGEPCT24HOUR"].toDouble(),
        changeday: json["CHANGEDAY"].toDouble(),
        changepctday: json["CHANGEPCTDAY"].toDouble(),
        changehour: json["CHANGEHOUR"].toDouble(),
        changepcthour: json["CHANGEPCTHOUR"].toDouble(),
        supply: json["SUPPLY"].toDouble(),
        mktcap: json["MKTCAP"].toDouble(),
        mktcappenalty: json["MKTCAPPENALTY"],
        circulatingsupply: json["CIRCULATINGSUPPLY"].toDouble(),
        circulatingsupplymktcap: json["CIRCULATINGSUPPLYMKTCAP"].toDouble(),
        totalvolume24H: json["TOTALVOLUME24H"].toDouble(),
        totalvolume24Hto: json["TOTALVOLUME24HTO"].toDouble(),
        totaltoptiervolume24H: json["TOTALTOPTIERVOLUME24H"].toDouble(),
        totaltoptiervolume24Hto: json["TOTALTOPTIERVOLUME24HTO"].toDouble(),
        imageurl: json["IMAGEURL"],
      );
}

class MetaData {
  MetaData({
    required this.count,
  });

  int count;

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        count: json["Count"],
      );
}

class RateLimit {
  RateLimit();

  factory RateLimit.fromJson(Map<String, dynamic> json) => RateLimit();
}
