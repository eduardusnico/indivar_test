class SecondaryDetail {
  String name;
  String url;

  SecondaryDetail({
    required this.name,
    required this.url,
  });

  factory SecondaryDetail.fromJson(Map<String, dynamic> json) =>
      SecondaryDetail(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
