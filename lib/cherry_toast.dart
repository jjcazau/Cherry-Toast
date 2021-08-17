import 'dart:async';
import 'package:cherry_toast/cherry_toast_icon.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:cherry_toast/resources/colors.dart';
import 'package:cherry_toast/resources/constants.dart';
import 'package:cherry_toast/resources/images.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CherryToast extends StatefulWidget {
  CherryToast(
      {required this.title,
      required this.icon,
      required this.themeColor,
      this.action,
      this.actionHandler,
      this.description,
      this.descriptionStyle = DEFAULT_DESCRIPTION_STYLE,
      this.titleStyle = DEFAULT_TITLTE_STYLE,
      this.actionStyle =
          const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      this.displayTitle = true,
      this.toastPosition = POSITION.TOP,
      this.animationDuration = DEFAULT_ANIMATION_DURATION,
      this.animationCurve = DEFAULT_ANIMATION_CURVE,
      this.animationType = ANIMATION_TYPE.FROM_LEFT,
      this.autoDismiss = false,
      this.toastDuration = DEFAULT_TOAST_DURATION,
      this.layout = TOAST_LAYOUT.LTR,
      this.displayCloseButton = true,
      this.borderRadius = DEFAULT_RADIUS,
      this.displayIcon = true});

  CherryToast.success(
      {required this.title,
      this.action,
      this.actionHandler,
      this.description,
      this.descriptionStyle = DEFAULT_DESCRIPTION_STYLE,
      this.titleStyle = DEFAULT_TITLTE_STYLE,
      this.actionStyle =
          const TextStyle(color: SUCCESS_COLOR, fontWeight: FontWeight.bold),
      this.displayTitle = true,
      this.toastPosition = POSITION.TOP,
      this.themeColor = SUCCESS_COLOR,
      this.animationDuration = DEFAULT_ANIMATION_DURATION,
      this.animationCurve = DEFAULT_ANIMATION_CURVE,
      this.animationType = ANIMATION_TYPE.FROM_LEFT,
      this.autoDismiss = false,
      this.toastDuration = DEFAULT_TOAST_DURATION,
      this.layout = TOAST_LAYOUT.LTR,
      this.displayCloseButton = true,
      this.borderRadius = DEFAULT_RADIUS,
      this.displayIcon = true}) {
    this.icon = Image(
      image: AssetImage(SUCCESS_ICON, package: PACKAGE_NAME),
      width: DEFAULT_ICON_SIZE,
    );
  }

  CherryToast.error(
      {required this.title,
      this.action,
      this.actionHandler,
      this.description,
      this.descriptionStyle = DEFAULT_DESCRIPTION_STYLE,
      this.titleStyle = DEFAULT_TITLTE_STYLE,
      this.actionStyle =
          const TextStyle(color: ERROR_COLOR, fontWeight: FontWeight.bold),
      this.displayTitle = true,
      this.toastPosition = POSITION.TOP,
      this.themeColor = ERROR_COLOR,
      this.animationDuration = DEFAULT_ANIMATION_DURATION,
      this.animationCurve = DEFAULT_ANIMATION_CURVE,
      this.animationType = ANIMATION_TYPE.FROM_LEFT,
      this.autoDismiss = false,
      this.toastDuration = DEFAULT_TOAST_DURATION,
      this.layout = TOAST_LAYOUT.LTR,
      this.displayCloseButton = true,
      this.borderRadius = DEFAULT_RADIUS,
      this.displayIcon = true}) {
    this.icon = Image(
      image: AssetImage(ERROR_ICON, package: PACKAGE_NAME),
      width: DEFAULT_ICON_SIZE,
    );
  }

  CherryToast.warning(
      {required this.title,
      this.action,
      this.actionHandler,
      this.description,
      this.descriptionStyle = DEFAULT_DESCRIPTION_STYLE,
      this.titleStyle = DEFAULT_TITLTE_STYLE,
      this.actionStyle =
          const TextStyle(color: WARINING_COLOR, fontWeight: FontWeight.bold),
      this.displayTitle = true,
      this.toastPosition = POSITION.TOP,
      this.themeColor = WARINING_COLOR,
      this.animationDuration = DEFAULT_ANIMATION_DURATION,
      this.animationCurve = DEFAULT_ANIMATION_CURVE,
      this.animationType = ANIMATION_TYPE.FROM_LEFT,
      this.autoDismiss = false,
      this.toastDuration = DEFAULT_TOAST_DURATION,
      this.layout = TOAST_LAYOUT.LTR,
      this.displayCloseButton = true,
      this.borderRadius = DEFAULT_RADIUS,
      this.displayIcon = true}) {
    this.icon = Image(
      image: AssetImage(WARNING_ICON, package: PACKAGE_NAME),
      width: DEFAULT_ICON_SIZE,
    );
  }

  CherryToast.info(
      {required this.title,
      this.action,
      this.actionHandler,
      this.description,
      this.descriptionStyle = DEFAULT_DESCRIPTION_STYLE,
      this.titleStyle = DEFAULT_TITLTE_STYLE,
      this.actionStyle =
          const TextStyle(color: INFO_COLOR, fontWeight: FontWeight.bold),
      this.displayTitle = true,
      this.toastPosition = POSITION.TOP,
      this.themeColor = INFO_COLOR,
      this.animationDuration = DEFAULT_ANIMATION_DURATION,
      this.animationCurve = DEFAULT_ANIMATION_CURVE,
      this.animationType = ANIMATION_TYPE.FROM_LEFT,
      this.autoDismiss = false,
      this.toastDuration = DEFAULT_TOAST_DURATION,
      this.layout = TOAST_LAYOUT.LTR,
      this.displayCloseButton = true,
      this.borderRadius = DEFAULT_RADIUS,
      this.displayIcon = true}) {
    this.icon = Image(
      image: AssetImage(INFO_ICON, package: PACKAGE_NAME),
      width: DEFAULT_ICON_SIZE,
    );
  }

  ///the toast title string
  ///
  final String title;

  ///The toast description text
  ///
  final String? description;

  ///The toast action button text
  ///
  final String? action;

  ///the text style that will be applied on the title
  ///by default it's `TextStyle(color: Colors.black, fontWeight: FontWeight.bold)`
  ///
  final TextStyle titleStyle;

  ///the text style that will be applied on the description
  ///
  final TextStyle descriptionStyle;

  ///the action button text style
  ///
  final TextStyle actionStyle;

  ///indicates whether display or not the title
  ///
  final bool displayTitle;

  ///the toast icon, it's required when using the default constructor
  ///
  late Widget icon;

  ///the toast display postion, possible values
  ///```dart
  ///{
  ///TOP,
  ///BOTTOM
  ///}
  ///```
  final POSITION toastPosition;

  ///The color that will be applied on the circle behind the icon
  ///for better rendering the action button must have the same color
  ///
  final Color themeColor;

  ///the function invoked when clicking on the action button
  ///
  final Function? actionHandler;

  ///The duration of the animation by default it's 1.5 seconds
  ///
  final Duration animationDuration;

  ///the animation curve by default it's set to `Curves.ease`
  ///
  final Cubic animationCurve;

  ///The animation type applied on the toast
  ///```dart
  ///{
  ///FROM_TOP,
  ///FROM_LEFT,
  ///FROM_RIGHT
  ///}
  ///```
  final ANIMATION_TYPE animationType;

  ///indicates whether the toast will be hidden automatically or not
  ///
  final bool autoDismiss;

  ///the duration of the toast if [autoDismiss] is true
  ///by default it's 3 seconds
  ///
  final Duration toastDuration;

  ///the layout of the toast
  ///```dart
  ///{
  ///LTR,
  ///RTL
  ///}
  ///```
  final TOAST_LAYOUT layout;

  ///Display / Hide the close button icon
  ///by default it's true
  final bool displayCloseButton;

  ///define the border radius applied on the toast
  ///by default it's 20
  ///
  final double borderRadius;

  ///Define whether the icon will be  rendered or not
  ///
  final bool displayIcon;

  ///Display the created cherry toast
  ///[context] the context of the application
  ///
  show(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
          pageBuilder: (context, _, __) => AlertDialog(
                backgroundColor: Colors.transparent,
                contentPadding: EdgeInsets.all(0),
                insetPadding: EdgeInsets.all(70),
                elevation: 0,
                content: this,
              ),
          opaque: false),
    );
  }

  @override
  _CherryToastState createState() => _CherryToastState();
}

class _CherryToastState extends State<CherryToast>
    with TickerProviderStateMixin {
  late Animation<Offset> offsetAnimation;
  late AnimationController slideController;
  late BoxDecoration toastDecoration;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    toastDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(this.widget.borderRadius),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 1), // changes position of shadow
        ),
      ],
    );
    if (this.widget.autoDismiss) {
      Timer(this.widget.toastDuration, () {
        slideController.reverse();
        Timer(this.widget.animationDuration, () {
          Navigator.pop(context);
        });
      });
    }
  }

  ///Initialize animation parameters [slideController] and [offsetAnimation]
  _initAnimation() {
    slideController = AnimationController(
      duration: this.widget.animationDuration,
      vsync: this,
    );
    switch (this.widget.animationType) {
      case ANIMATION_TYPE.FROM_LEFT:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(-2, 0),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
            parent: slideController, curve: this.widget.animationCurve));
        break;
      case ANIMATION_TYPE.FROM_RIGHT:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(2, 0),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
            parent: slideController, curve: this.widget.animationCurve));
        break;
      case ANIMATION_TYPE.FROM_TOP:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(0, -2),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
            parent: slideController, curve: this.widget.animationCurve));
        break;
      default:
    }
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      slideController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this.widget.layout == TOAST_LAYOUT.LTR) {
      return _renderLeftLayoutToast(context);
    } else {
      return _renderRightLayoutToast(context);
    }
  }

  ///render a left layout toast if [this.widget.layout] set to LTR
  ///
  Widget _renderLeftLayoutToast(BuildContext context) {
    return Column(
      mainAxisAlignment: this.widget.toastPosition == POSITION.TOP
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        SlideTransition(
          position: offsetAnimation,
          child: Container(
            decoration: toastDecoration,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: this.widget.description == null &&
                              this.widget.action == null
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        this.widget.displayIcon
                            ? CherryToatIcon(
                                color: this.widget.themeColor,
                                icon: Icons.check_circle,
                                iconSize: DEFAULT_ICON_SIZE,
                              )
                            : Container(),
                        _renderToastContent(),
                      ],
                    ),
                  ),
                  this.widget.displayCloseButton
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10, right: 10),
                          child: _renderCloseButton(context),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  ///render a right layout toast if [this.widget.layout] set to RTL
  ///
  Column _renderRightLayoutToast(BuildContext context) {
    return Column(
      mainAxisAlignment: this.widget.toastPosition == POSITION.TOP
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        SlideTransition(
          position: offsetAnimation,
          child: Container(
            decoration: toastDecoration,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  this.widget.displayCloseButton
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: _renderCloseButton(context),
                        )
                      : Container(),
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: this.widget.description == null &&
                              this.widget.action == null
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        _renderToastContent(),
                        CherryToatIcon(
                          color: this.widget.themeColor,
                          icon: Icons.check_circle,
                          iconSize: DEFAULT_ICON_SIZE,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// render the close button icon with a clickable  widget that
  /// will hide the toast
  ///
  InkWell _renderCloseButton(BuildContext context) {
    return InkWell(
      onTap: () {
        slideController.reverse();
        Timer(this.widget.animationDuration, () {
          Navigator.pop(context);
        });
      },
      child: Image(
        image: AssetImage(CLOSE_ICON, package: PACKAGE_NAME),
        width: CLOSE_BUTTON_SIZE,
      ),
    );
  }

  ///render the toast content (Title, Description and Action)
  ///
  Expanded _renderToastContent() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: this.widget.layout == TOAST_LAYOUT.LTR
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            this.widget.displayTitle
                ? Text(this.widget.title, style: this.widget.titleStyle)
                : Container(),
            this.widget.description == null
                ? Container()
                : Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(this.widget.description ?? "",
                          style: this.widget.descriptionStyle)
                    ],
                  ),
            this.widget.action != null
                ? Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                          onTap: () {
                            this.widget.actionHandler?.call();
                          },
                          child: Text(this.widget.action ?? "",
                              style: this.widget.actionStyle))
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
