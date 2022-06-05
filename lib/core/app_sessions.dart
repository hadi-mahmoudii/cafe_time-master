class AppSession {
  
  static double _deviceWidth = 0;
  static double get deviceWidth {
    return AppSession._deviceWidth;
  }

  static set deviceWidth(double deviceWidth) {
    AppSession._deviceWidth = deviceWidth;
  }

  static double _deviceBlockSize = 0;
  static double get deviceBlockSize {
    return AppSession._deviceBlockSize;
  }

  static set deviceBlockSize(double deviceBlockSize) {
    AppSession._deviceBlockSize = deviceBlockSize;
  }

  static double _deviceHeigth = 0;
  static double get deviceHeigth {
    return AppSession._deviceHeigth;
  }

  static set deviceHeigth(double deviceHeigth) {
    AppSession._deviceHeigth = deviceHeigth;
  }
}