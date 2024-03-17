class Coinmodel {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;
  final int marketCapRank;
  final double high24h;
  final double low24h;
  final double? priceChange24H;
  final double priceChangePercentage24h;

  Coinmodel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCapRank,
    required this.high24h,
    required this.low24h,
    required this.priceChangePercentage24h,
    this.priceChange24H,
  });

  factory Coinmodel.fromJson(Map<String, dynamic> json) {
    return Coinmodel(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      image: json['image'],
      currentPrice: json['current_price'].toDouble(),
      marketCapRank: json['market_cap_rank'],
      high24h: json['high_24h'].toDouble(),
      low24h: json['low_24h'].toDouble(),
      priceChange24H: json["price_change_24h"]?.toDouble(),
      priceChangePercentage24h: json['price_change_percentage_24h'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'symbol': symbol,
      'name': name,
      'image': image,
      'current_price': currentPrice,
      'market_cap_rank': marketCapRank,
      'high_24h': high24h,
      'low_24h': low24h,
      "price_change_24h": priceChange24H,
      'price_change_percentage_24h': priceChangePercentage24h,
    };
  }
}
