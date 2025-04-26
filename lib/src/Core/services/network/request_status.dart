import 'package:flutter/material.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Ui/empty/empty_imports.dart';
import 'package:jumper/src/Ui/loading/loading.dart';
import 'package:jumper/src/Ui/snackbar/app_snacks.dart';

enum RequestStatus {
  initial,
  loading,
  done,
  error,
  connectionError,
}

class RequestStatusBuilder extends StatelessWidget {
  final RequestStatus status;
  final Widget onDone;
  final Widget? onConnectionError;
  final Widget? onError;
  final Widget? onLoading;

  const RequestStatusBuilder({
    Key? key,
    required this.status,
    required this.onDone,
    this.onConnectionError,
    this.onError,
    this.onLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? widget;
    if (status == RequestStatus.loading) {
      widget = onLoading ?? Loading.staggeredDotsWave();
    } else if (status == RequestStatus.connectionError) {
      widget = onConnectionError ?? const NoConnectionScreen();

      /// change Later
    } else if (status == RequestStatus.error) {
      widget = onError ?? onDone;
    } else {
      widget = onDone;
    }
    return widget;
  }
}

class DataStatusBuilder extends StatelessWidget {
  final DataState status;
  final Widget? initialBuild;
  final Widget onDoneBuild;
  final Widget? onConnectionErrorBuild;
  final Widget? onErrorBuild;
  final Widget? onLoadingBuild;
  final VoidCallback? onRedirectCallback;

  const DataStatusBuilder({
    Key? key,
    required this.status,
    required this.onDoneBuild,
    this.onConnectionErrorBuild,
    this.initialBuild,
    this.onErrorBuild,
    this.onLoadingBuild,
    this.onRedirectCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? widget = const SizedBox();
    if (status is DataInitial) {
      widget = initialBuild ?? const SizedBox();
    } else if (status is DataLoading) {
      widget = onLoadingBuild ?? Loading.staggeredDotsWave();
    } else if (status is DataSuccess) {
      widget = onDoneBuild;
    } else if (status is DataFailed) {
      if (status.error!.errorType == ErrorType.networkConnection) {
        widget = onConnectionErrorBuild ??
            NoConnectionScreen(
              onRedirect: onRedirectCallback,
            );

        /// change Later
      } else {
        widget = onErrorBuild ??
            UnKnownErrorScreen(
              onRedirect: onRedirectCallback,
            );
      }
    } else {
      widget = onLoadingBuild ?? Loading.staggeredDotsWave();
    }
    return widget;
  }
}

class BottomRequestStatusBuilder extends StatelessWidget {
  final DataState status;
  final Widget bottomWidget;

  const BottomRequestStatusBuilder({
    Key? key,
    required this.status,
    required this.bottomWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? widget;
    if (status is DataInitial) {
      widget = bottomWidget;
    } else if (status is DataLoading) {
      widget = Loading.fourRotatingDots();
    } else if (status is DataFailed) {
      if (status.error!.errorType == ErrorType.networkConnection) {
        /// change Later
        widget = bottomWidget;
        AppSnacks.connectionError();
      } else if (status.error!.errorType == ErrorType.message) {
        widget = bottomWidget;
        AppSnacks.requestError(error: status.error!.errorTitle);
      } else {
        widget = bottomWidget;
      }
    } else {
      widget = bottomWidget;
    }
    return widget;
  }
}
