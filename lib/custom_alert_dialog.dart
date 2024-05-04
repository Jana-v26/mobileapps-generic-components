import 'dart:async';

import 'package:flutter/material.dart';

class ExpandedAlertDialog extends StatelessWidget {
  final IconData? iconData;
  final String? alertText;

  const ExpandedAlertDialog({super.key, this.iconData, this.alertText});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pop();
    });
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              iconData != null ? Icons.done_outline_outlined : iconData,
              color: Colors.green,
              size: 25,
            ),
            Text(
              alertText ?? 'Done',
              style: const TextStyle(
                // color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}

class CustomAlertDialogs {
  FutureOr<void> showDeleteAlert(
      BuildContext context, {
        String? title,
        String? description,
        required GestureTapCallback deleteAction,
        required GestureTapCallback cancelAction,
        String? deleteButtonString = "",
        String? cancelButtonString = "",
        // bool? isLeading = false,
        bool? isTitle = false,
        // bool? isTrailing = false,
        // Widget leadingWidgetButton1 = const Expanded(child: SizedBox.shrink()),
        // Widget trailingWidgetButton1 = const Expanded(child: SizedBox.shrink()),
        // Widget leadingWidgetButton2 = const Expanded(child: SizedBox.shrink()),
        // Widget trailingWidgetButton2 = const Expanded(child: SizedBox.shrink()),
        double? buttonWidth,
        double? buttonHeight,
      }) async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => DeleteAlertDialog(
          title: title,
          description: description,
          deleteAction: deleteAction,
          cancelAction: cancelAction,
          deleteButtonString: deleteButtonString,
          cancelButtonString: cancelButtonString,
          // isLeading: isLeading,
          isTitle: isTitle,
          // leadingWidgetButton1: leadingWidgetButton1,
          // leadingWidgetButton2: leadingWidgetButton1,
          buttonHeight: buttonHeight,
          buttonWidth: buttonWidth,
        ));
  }

  FutureOr<void> showExpandedAlertDialog(
      BuildContext context, IconData? iconData,
      {alertText}) async {
    await showDialog(
        useSafeArea: false,
        barrierDismissible: false,
        context: context,
        builder: (context) => const ExpandedAlertDialog());
  }
}

class DeleteAlertDialog extends StatelessWidget {
  final String? title;
  final String? description;
  final GestureTapCallback deleteAction;
  final GestureTapCallback cancelAction;
  final String? deleteButtonString;
  final String? cancelButtonString;
  final bool? isTitle;

  final Widget titleWidget;
  final double? buttonWidth;
  final double? buttonHeight;

  const DeleteAlertDialog(
      {super.key,
        this.title,
        this.description,
        required this.deleteAction,
        required this.cancelAction,
        this.cancelButtonString,
        this.deleteButtonString,
        // this.isLeading,
        this.isTitle,
        // this.leadingWidgetButton1 = const SizedBox.shrink(),
        // this.leadingWidgetButton2 = const SizedBox.shrink(),
        this.titleWidget = const SizedBox.shrink(),
        this.buttonHeight,
        this.buttonWidth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Center(
        child: Container(
            width: buttonWidth ?? MediaQuery.of(context).size.width * 0.8,
            height: buttonHeight ?? MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).dividerColor, width: 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ListTile(
                  title: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 5)),
                    child: const Center(
                      child: Icon(
                        Icons.delete_forever_outlined,
                        size: 40,
                        // color: Colors.white,
                      ),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      title ?? "Delete",
                      style: const TextStyle(
                        // color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    description ?? "",
                    style: const TextStyle(
                      // color: Colors.white70,
                    ),
                    softWrap: true,
                  ),
                ),
                AlertButtons(
                    onTap: deleteAction,
                    buttonWidth: buttonWidth,
                    buttonHeight: buttonHeight,
                    isTitle: isTitle,
                    isDeleteButton: true,
                    titleWidget: titleWidget,
                    buttonText: deleteButtonString!.isEmpty
                        ? "Delete"
                        : deleteButtonString!),
                AlertButtons(
                    onTap: cancelAction,
                    buttonWidth: buttonWidth,
                    buttonHeight: buttonHeight,
                    isTitle: isTitle,
                    titleWidget: titleWidget,
                    isDeleteButton: false,
                    buttonText: cancelButtonString!.isEmpty
                        ? "Cancel"
                        : cancelButtonString!)
              ],
            )),
      ),
    );
  }
}

class AlertButtons extends StatelessWidget {
  const AlertButtons(
      {super.key,
        required this.onTap,
        required this.buttonWidth,
        required this.buttonHeight,
        required this.isTitle,
        required this.titleWidget,
        this.isDeleteButton,
        required this.buttonText});

  final GestureTapCallback onTap;
  final double? buttonWidth;
  final double? buttonHeight;
  final bool? isTitle;
  final bool? isDeleteButton;
  final String buttonText;
  final Widget titleWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: buttonWidth ?? MediaQuery.of(context).size.width * 0.6,
        height: buttonHeight ?? MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.onSurface,
              // Colors.white,
              width: 1,
            ),
            shape: BoxShape.rectangle,
            color: isDeleteButton!
                ? Colors.blueAccent
                : Theme.of(context).scaffoldBackgroundColor
          //  Colors.black,
        ),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            !isTitle!
                ? Center(
              child: Text(
                buttonText,
                style: const TextStyle(
                  // color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
            )

            /// if dev wants to add any customized widget or list-tile instead of text titleWidget can be used.
                : titleWidget
          ],
        ),
      ),
    );
  }
}

enum AlertButtonEnum { delete, cancel, active, deactivate, accept, decline }
