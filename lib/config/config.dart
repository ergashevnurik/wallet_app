String get apiHost {
  bool isProd = const bool.fromEnvironment('dart.vm.product');
  if (isProd) {
    return 'https://app.encode.uz';
    // replace with your production API endpoint
  }

  return "http://10.0.2.2:82";
  // replace with your own development API endpoint
}