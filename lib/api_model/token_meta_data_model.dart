class TokenMetaDataModel {
  final String tokenType;

  TokenMetaDataModel({
    required this.tokenType,
  });

  Map<String, dynamic> toMap() {
    return {
      'tokenType': tokenType,
    };
  }

  factory TokenMetaDataModel.fromMap(Map<String, dynamic> map) {
    return TokenMetaDataModel(
      tokenType: map['tokenType'] as String,
    );
  }
}
