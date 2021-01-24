import 'dart:async';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/foundation.dart';

import 'AdsDetails.dart';

class AdsManager {
  static final AdsManager instance = AdsManager._privateConstructor();
  Function _whenFinished;

  final MobileAdTargetingInfo _targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['JetPack', 'Hero', 'Adventure', 'Run', 'Game'],
    nonPersonalizedAds: true,
    testDevices: <String>[],
  );

  InterstitialAd _interstitialAd;
  bool _adLoaded = false;
  bool _cacheOngoing = false;

  int _timer = 1000;

  AdsManager._privateConstructor() {
    FirebaseAdMob.instance
        .initialize(appId: (kReleaseMode ? appId : FirebaseAdMob.testAppId));
    _whenFinished = _doNothing;
  }

  Future<void> cacheAd() async {
    await _cacheAd();
  }

  Future<void> _cacheAd() async {
    try {
      if (!_cacheOngoing) {
        _cacheOngoing = true;
        await _interstitialAd?.dispose();
        _interstitialAd = _createInterstitialAd();
        await _interstitialAd.load();
        _cacheOngoing = false;
      }
    } catch (Exception) {}
  }

  InterstitialAd _createInterstitialAd() {
    return InterstitialAd(
        adUnitId: kReleaseMode ? adUnitId : InterstitialAd.testAdUnitId,
        targetingInfo: _targetingInfo,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.closed) {
            _cacheAd();
            _whenFinished();
          } else if (event == MobileAdEvent.loaded) {
            _adLoaded = true;
            _timer = 1000;
          } else if (event == MobileAdEvent.failedToLoad) {
            Timer(Duration(milliseconds: _timer), () {
              if (_timer < 30000) _timer += 1000;
              _cacheAd();
            });
          }
        });
  }

  Future<void> playNewAd(Function whenFinished) async {
    _whenFinished = whenFinished;
    try {
      if (_adLoaded) {
        _adLoaded = false;
        _interstitialAd?.show();
      } else {
        _cacheAd();
        _whenFinished();
      }
    } catch (Exception) {
      _whenFinished();
    }
  }

  void _doNothing() {}
}
