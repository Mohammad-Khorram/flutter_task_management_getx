import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task_management/config/boilerplate/base_classes_boilerplate.dart';
import 'package:task_management/core/widget/loading.dart';

abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller> {
  BaseView({super.key});

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(context) {
    return Stack(
      children: [
        Obx(
          () => controller.pageState.when(
            idle: () => annotatedRegion(context),
            loading: loading,
            data: (data) => annotatedRegion(context),
            lostConnection: () => annotatedRegion(context),
          ),
        ),
      ],
    );
  }

  Widget annotatedRegion(context) => AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light),
        child: Material(color: Colors.transparent, child: pageContent(context)),
      );

  Widget pageContent(context) => safeArea()
      ? SafeArea(child: pageScaffold(context))
      : pageScaffold(context);

  Widget pageScaffold(context) => WillPopScope(
        onWillPop: () => onWillPop(context),
        child: Scaffold(
          key: globalKey,
          floatingActionButton: floatingActionButton(),
          floatingActionButtonLocation: floatingActionButtonLocation(),
          body: body(context),
          bottomNavigationBar: bottomNavigationBar(context),
          drawer: drawer(),
          resizeToAvoidBottomInset: resizeToAvoidBottomInset(),
        ),
      );

  Future<bool> onWillPop(context) async {
    Get.back();
    return true;
  }

  bool safeArea() => true;

  bool resizeToAvoidBottomInset() => true;

  Widget body(BuildContext context);

  Widget? drawer() => null;

  Widget? bottomNavigationBar(context) => null;

  Widget? floatingActionButton() => null;

  FloatingActionButtonLocation? floatingActionButtonLocation() =>
      FloatingActionButtonLocation.endFloat;

  Widget loading() => const Center(child: LoadingWidget());

  Widget smallLoading() => const PaginateLoadingWidget();
}
