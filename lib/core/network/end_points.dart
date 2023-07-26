enum EndPoints {
  baseUrl(url: EndPoints._baseUrl),
  eod(url: "${EndPoints._baseUrl}/eod");

  const EndPoints({required this.url});

  final String url;
  static const _baseUrl = "http://api.marketstack.com/v1";
}
