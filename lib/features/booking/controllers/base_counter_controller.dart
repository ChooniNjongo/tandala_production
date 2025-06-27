import 'package:get/get.dart';

abstract class BaseCounterController extends GetxController {
  int get count;
  void increment();
  void decrement();
  void reset();
  void setValue(int value);

  // Optional properties that can be overridden
  int get minValue => 0;
  int get maxValue => 100;
  int get initialValue => 0;
}

// default_counter_controller.dart
class DefaultCounterController extends BaseCounterController {
  final RxInt _count = 0.obs;
  final int _minValue;
  final int _maxValue;
  final int _initialValue;

  DefaultCounterController({
    int minValue = 0,
    int maxValue = 100,
    int initialValue = 0,
  }) : _minValue = minValue,
        _maxValue = maxValue,
        _initialValue = initialValue {
    _count.value = initialValue;
  }

  @override
  int get count => _count.value;

  @override
  int get minValue => _minValue;

  @override
  int get maxValue => _maxValue;

  @override
  int get initialValue => _initialValue;

  @override
  void increment() {
    if (_count.value < maxValue) {
      _count.value++;
    }
  }

  @override
  void decrement() {
    if (_count.value > minValue) {
      _count.value--;
    }
  }

  @override
  void reset() {
    _count.value = initialValue;
  }

  @override
  void setValue(int value) {
    if (value >= minValue && value <= maxValue) {
      _count.value = value;
    }
  }
}