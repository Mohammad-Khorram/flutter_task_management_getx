import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/config/boilerplate/base_classes_boilerplate.dart';

abstract class BaseController extends GetxController
    with WidgetsBindingObserver {
  final Rx<ResultState<dynamic>> _pageStateController =
      const ResultState.idle().obs;

  ResultState get pageState => _pageStateController.value;

  ResultState updatePageState(final ResultState state) =>
      _pageStateController(state);

  ResultState showLoading() => updatePageState(const ResultState.loading());

  ResultState resetPageState() => updatePageState(const ResultState.idle());

  ResultState hideLoading() => resetPageState();

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
