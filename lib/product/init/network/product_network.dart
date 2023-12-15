import 'package:vexana/vexana.dart';

class ProductNetwork {
  static ProductNetwork? _instance;
  static ProductNetwork get instance {
    _instance ??= ProductNetwork._init();
    return _instance!;
  }

  late final INetworkManager networkManager;

  ProductNetwork._init() {
    networkManager =
        NetworkManager<EmptyModel>(options: BaseOptions(baseUrl: 'https://fluttertr-ead5c.firebaseio.com/'));
  }
}
