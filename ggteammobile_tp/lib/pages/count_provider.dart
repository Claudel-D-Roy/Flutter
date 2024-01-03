import 'package:flutter/foundation.dart';

class CountProvider extends ChangeNotifier {
  /// for static progress bar
  int _count1 = 0;
  int _countRight = 0;
  int get count1 => this._count1;
  int get countRight => this._countRight;
  set count1(int i) => throw "error";
  set countRight(int i) => throw "error";

  /// for animated progress bar
  double _countLeftScreen = 0.0;
  double get countLeftScreen => this._countLeftScreen;
  set count2(double i) => throw "error";

  double _countRightScreen = 0.0;
  double get countRightScreen => this._countRightScreen;
  set count3(double i) => throw "error";

  int _couponCount = 2;
  int get couponCount => this._couponCount;
  set couponCount(int i) => throw "error";

  bool _needNewCoupon = false;
  bool get needNewCoupon => this._needNewCoupon;
  set needNewCoupon(bool b) => throw "error";

  void addCount1(){
    if (this._count1 == 7) return;
    this._count1++;
    this.notifyListeners();
  }

  void removeCount1(){
    if (this._count1 == 0) return;
    this._count1--;
    this.notifyListeners();
  }

    void addCount2(){
    if (this._countRight == 7) return;
    this._countRight++;
    this.notifyListeners();
  }

  void removeCount2(){
    if (this._countRight == 0) return;
    this._countRight--;
    this.notifyListeners();
  }
/*ANIMATED BAR*/ 
  void changeCount(double count){
    this._countLeftScreen = count;
    this.notifyListeners();
  }

    void changeCount2(double count){
    this._countRightScreen = count;
    this.notifyListeners();
  }

  void resetCount(){
    this.notifyListeners();
  }
}