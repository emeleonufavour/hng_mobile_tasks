import 'package:hng_1_task/features/features.dart';
import 'package:hng_1_task/utils/utils.dart';

class PageViewModel extends PageChangeNotifier {
  String _encryptedData = "";
  String _decryptedData = "";
  bool _isLoading = false;

  String get encryptedData => _encryptedData;
  String get decryptedData => _decryptedData;
  bool get isLoading => _isLoading;

  void setIsLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<void> performAction(
      PageType pageType, String text, String password) async {
    try {
      setIsLoading(true);

      final res = await pageType.onTap(text, password);

      if (pageType == PageType.encrypt) {
        _encryptedData = res;
      } else {
        _decryptedData = res;
      }

      notifyListeners();
    } catch (e) {
      throw Exception(e);
    } finally {
      setIsLoading(false);
    }
  }

  void resetData() {
    _encryptedData = "";
    _decryptedData = "";
    notifyListeners();
  }
}
