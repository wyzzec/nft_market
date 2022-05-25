class UrlTransformer {


  static String urlTranformer(String url) {
    if (url.contains('ipfs://')) {
      url = url.replaceRange(0, 7, 'https://ipfs.io/ipfs/');
    }
    return url;
  }
}
