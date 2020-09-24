import 'package:firebase_admob/firebase_admob.dart';

const String testDevice = 'YOUR_DEVICE_ID';

class AdService {
  static BannerAd _bannerAd;
  static BannerAd _bottomBannerAd;

  AdService() {
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
  }

  /*static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    childDirected: true,
    nonPersonalizedAds: true,
  );*/

  BannerAd _createBannerAd() {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.banner,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }

  void showBannerAd() {
    if (_bannerAd == null) _bannerAd = _createBannerAd();
    _bannerAd
      ..load()
      ..show(anchorOffset: 152, anchorType: AnchorType.top);
  }

  void showBottomBannerAd() {
    if (_bottomBannerAd == null) _bottomBannerAd = _createBannerAd();
    _bottomBannerAd
      ..load()
      ..show(anchorOffset: 0, anchorType: AnchorType.bottom);
  }

  void hideBannerAd() async {
    await _bannerAd.dispose();
    _bannerAd = null;
  }

  void hideBottomBannerAd() async {
    await _bottomBannerAd.dispose();
    _bottomBannerAd = null;
  }
}
