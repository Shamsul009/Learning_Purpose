library sweet_alert_v2;

import 'package:flutter/material.dart';
import './sweet_alert_v2.dart';
import './src/cancel.dart';
import './src/confirm.dart';
import './src/success.dart';

typedef bool SweetAlertV2OnPress(bool isConfirm);

enum SweetAlertV2Style { success, error, confirm, loading }

class SweetAlertV2Options {
  /// Title string
  final String title;

  /// Subtitle string
  final String subtitle;

  final SweetAlertV2OnPress? onPress;

  /// Default value is `SweetAlertV2.success` when `showCancelButton`=false
  /// and `SweetAlertV2.danger` when `showCancelButton` = true
  final Color? confirmButtonColor;

  /// Default value is `SweetAlertV2.cancel`
  final Color? cancelButtonColor;

  /// Default value is `SweetAlertV2.successText` when `showCancelButton`=false
  /// and `SweetAlertV2.dangerText` when `showCancelButton` = true
  final String? confirmButtonText;

  /// Default value is `SweetAlertV2.cancelText`
  final String? cancelButtonText;

  /// If set to true, two buttons will be displayed.
  final bool showCancelButton;

  /// The padding of the title text
  final EdgeInsets? titlePadding;

  /// The padding of the subtitle text
  final EdgeInsets? subtitlePadding;

  /// Alignment of the title text
  final TextAlign? titleTextAlign;

  /// Style of the title text
  final TextStyle? titleStyle;

  /// Alignment of the subtitle text
  final TextAlign? subtitleTextAlign;

  /// Style of the subtitle text
  final TextStyle? subtitleStyle;

  final SweetAlertV2Style style;

  SweetAlertV2Options({
    this.showCancelButton = false,
    this.title = '',
    this.subtitle = '',
    this.onPress,
    this.cancelButtonColor,
    this.cancelButtonText,
    this.confirmButtonColor,
    this.confirmButtonText,
    this.titlePadding,
    this.subtitlePadding,
    this.titleTextAlign,
    this.titleStyle,
    this.subtitleTextAlign,
    this.subtitleStyle,
    required this.style,
  });
}

class SweetAlertV2Dialog extends StatefulWidget {
  /// animation curve when showing,if null,default value is `SweetAlertV2.showCurve`
  final Curve? curve;

  final SweetAlertV2Options options;

  SweetAlertV2Dialog({
    required this.options,
    this.curve,
  });

  @override
  State<StatefulWidget> createState() {
    return new SweetAlertV2DialogState();
  }
}

class SweetAlertV2DialogState extends State<SweetAlertV2Dialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> tween;

  late SweetAlertV2Options _options;

  @override
  void initState() {
    super.initState();
    _options = widget.options;
    controller = AnimationController(vsync: this);
    tween = Tween(begin: 0.0, end: 1.0).animate(controller);
    controller.animateTo(1.0,
        duration: const Duration(milliseconds: 300),
        curve: widget.curve ?? SweetAlertV2.showCurve);

    SweetAlertV2._state = this;
  }

  @override
  void dispose() {
    controller.dispose();
    SweetAlertV2._state = null;
    super.dispose();
  }

  @override
  void didUpdateWidget(SweetAlertV2Dialog oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void confirm() {
    if (_options.onPress != null && _options.onPress!(true) == false) return;
    Navigator.pop(context);
  }

  void cancel() {
    if (_options.onPress != null && _options.onPress!(false) == false) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listOfChildren = [];

    switch (_options.style) {
      case SweetAlertV2Style.success:
        listOfChildren.add(SizedBox(
          width: 64.0,
          height: 64.0,
          child: SuccessView(),
        ));
        break;
      case SweetAlertV2Style.confirm:
        listOfChildren.add(SizedBox(
          width: 64.0,
          height: 64.0,
          child: ConfirmView(),
        ));
        break;
      case SweetAlertV2Style.error:
        listOfChildren.add(SizedBox(
          width: 64.0,
          height: 64.0,
          child: CancelView(),
        ));
        break;
      case SweetAlertV2Style.loading:
        listOfChildren.add(SizedBox(
          width: 64.0,
          height: 64.0,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ));
        break;
    }

    if (_options.title != null) {
      listOfChildren.add(Padding(
        padding: _options.titlePadding ??
            const EdgeInsets.only(left: 10.0, top: 10.0),
        child: Text(
          _options.title!,
          textAlign: _options.titleTextAlign ?? TextAlign.left,
          style: _options.titleStyle ??
              const TextStyle(
                fontSize: 25.0,
                color: Color(0xff575757),
              ),
        ),
      ));
    }

    if (_options.subtitle != null) {
      listOfChildren.add(Padding(
        padding: _options.subtitlePadding ?? const EdgeInsets.only(top: 10.0),
        child: Text(
          _options.subtitle!,
          textAlign: _options.subtitleTextAlign ?? TextAlign.left,
          style: _options.subtitleStyle ??
              const TextStyle(
                fontSize: 16.0,
                color: Color(0xff797979),
              ),
        ),
      ));
    }

    if (_options.style != SweetAlertV2Style.loading) {
      if (_options.showCancelButton) {
        listOfChildren.add(Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                onPressed: cancel,
                color: _options.cancelButtonColor ?? SweetAlertV2.cancel,
                child: Text(
                  _options.cancelButtonText ?? SweetAlertV2.cancelText,
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              MaterialButton(
                onPressed: confirm,
                color: _options.confirmButtonColor ?? SweetAlertV2.danger,
                child: Text(
                  _options.confirmButtonText ?? SweetAlertV2.confirmText,
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ],
          ),
        ));
      } else {
        listOfChildren.add(Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: MaterialButton(
            onPressed: confirm,
            color: _options.confirmButtonColor ?? SweetAlertV2.success,
            child: Text(
              _options.confirmButtonText ?? SweetAlertV2.successText,
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
        ));
      }
    }

    return Center(
      child: AnimatedBuilder(
        animation: controller,
        builder: (c, w) {
          return ScaleTransition(
            scale: tween,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: listOfChildren,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void update(SweetAlertV2Options options) {
    setState(() {
      _options = options;
    });
  }
}

abstract class SweetAlertV2 {
  static Color success = const Color(0xffAEDEF4);
  static Color danger = const Color(0xffDD6B55);
  static Color cancel = const Color(0xffD0D0D0);

  static String successText = "OK";
  static String confirmText = "Confirm";
  static String cancelText = "Cancel";

  static Curve showCurve = Curves.bounceOut;

  static SweetAlertV2DialogState? _state;

  static void show(
    BuildContext context, {
    Curve? curve,
    String? title,
    String? subtitle,
    bool showCancelButton = false,
    SweetAlertV2OnPress? onPress,
    Color? cancelButtonColor,
    Color? confirmButtonColor,
    String? cancelButtonText,
    String? confirmButtonText,
    EdgeInsets? titlePadding,
    EdgeInsets? subtitlePadding,
    TextAlign? titleTextAlign,
    TextStyle? titleStyle,
    TextAlign? subtitleTextAlign,
    TextStyle? subtitleStyle,
    SweetAlertV2Style? style,
  }) {
    SweetAlertV2Options options = SweetAlertV2Options(
      showCancelButton: showCancelButton,
      title: title!,
      subtitle: subtitle!,
      style: style!,
      onPress: onPress,
      confirmButtonColor: confirmButtonColor,
      confirmButtonText: confirmButtonText,
      cancelButtonText: cancelButtonText,
      cancelButtonColor: cancelButtonColor,
      titlePadding: titlePadding,
      subtitlePadding: subtitlePadding,
      titleTextAlign: titleTextAlign,
      titleStyle: titleStyle,
      subtitleTextAlign: subtitleTextAlign,
      subtitleStyle: subtitleStyle,
    );
    if (_state != null) {
      _state!.update(options);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SweetAlertV2Dialog(
                  curve: curve,
                  options: options,
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
