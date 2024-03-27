import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_users/core/shared/utils/global_function.dart';
import 'package:my_users/core/shared/utils/palette.dart';

List<Map> colors = [
  {"key": "1", "value": "#20BF6B", "font": "#ffffff"},
  {"key": "0", "value": "#a5b1c2", "font": "#20BF6B"},
  {"key": "Trial", "value": "#f7b731", "font": "#ffffff"},
  {"key": "Post Trial", "value": "#fa8231", "font": "#ffffff"},
  {"key": "Post Subscribe", "value": "#adc021", "font": "#ffffff"},
  {"key": "Subscribe", "value": "#20BF6B", "font": "#ffffff"},
  {"key": "Active", "value": "#20BF6B", "font": "#ffffff"},
  {"key": "Awaiting Approval", "value": "#DEA42C", "font": "#ffffff"},
  {"key": "Awaiting Payment", "value": "#2d98da", "font": "#ffffff"},
  {"key": "Overlimit", "value": "#C1314A", "font": "#ffffff"},
  {"key": "Done", "value": "#a5b1c2", "font": "#ffffff"},
  {"key": "Selesai", "value": "#EDEEF1", "font": "#A5AEBD"},
  {"key": "Expired", "value": "#eb3b5a", "font": "#ffffff"},
  {"key": "Inactive", "value": "#a5b1c2", "font": "#ffffff"},
  {"key": "Suspend", "value": "#C06B21", "font": "#ffffff"},
  {"key": "WAITING", "value": "#2d98da", "font": "#ffffff"},
  {"key": "PENDING", "value": "#fa8231", "font": "#ffffff"},
  {"key": "FAILED", "value": "#eb3b5a", "font": "#ffffff"},
  {"key": "COMPLETED", "value": "#20bf6b", "font": "#ffffff"},
  {"key": "SUCCEEDED", "value": "#20bf6b", "font": "#ffffff"},
  {"key": "waiting", "value": "#2d98da", "font": "#ffffff"},
  {"key": "pending", "value": "#fa8231", "font": "#ffffff"},
  {"key": "failed", "value": "#eb3b5a", "font": "#ffffff"},
  {"key": "completed", "value": "#20bf6b", "font": "#ffffff"},
  {"key": "succeded", "value": "#20bf6b", "font": "#ffffff"},
  {"key": "Not Started Yet", "value": "#EB3B5A", "font": "#ffffff"},
  {"key": "In Progress", "value": "#0F7AAE", "font": "#ffffff"},
  {"key": "Finished", "value": "#20BF6B", "font": "#ffffff"},
  {"key": "Approved", "value": "#20BF6B", "font": "#ffffff"},
];

Color colorSubtitles(String? value) {
  Color color = Palette.g40;
  for (var i = 0; i < colors.length; i++) {
    if (value == colors[i]["key"]) {
      color = Palette.hexToColor(colors[i]["value"]);
    }
  }

  return color;
}

enum MoreOptionType {
  /// Access More Option from three dot option
  moreOption,

  /// Access More Option from tapping component list
  moreOptionTap,
}

class CustomListTile extends StatefulWidget {
  final String title;
  final double? sizeTitle;
  final Color? colorTitle;
  final String? subtitle;
  final String? subtitles;
  final String? subsubtitles;
  final String? subtitles2;
  final String? subtitles3;
  final String? subtitles4;
  final String? subsubtitles2;
  final String? subsubtitles3;
  final String? subsubtitles4;
  final Color? colorSubtitle;
  final Color? colorSubtitles;
  final Color? colorSubtitles2;
  final Color? colorSubtitles3;
  final Color? colorSubtitles4;
  final Color? colorSubsubtitles;
  final Color? colorSubsubtitles2;
  final Color? colorSubsubtitles3;
  final Color? colorSubsubtitles4;
  final Color? colortrailingText;
  final String? subtitle2;
  final Color? colorSubtitle2;
  final String? subtitle3;
  final Color? colorSubtitle3;
  final String? subtitle4;
  final Color? colorSubtitle4;
  final Color? colorBgStatus;
  final Color? colorStatus;
  final double? height;
  final double? subtitleSize;

  final Color? splashColor;
  final Color? highlightColor;

  final BorderRadius? borderRadiusInk;

  final String? status;
  final String? trailingText;

  final String? titleMore1;
  final String? titleMore2;
  final String? titleMore3;

  final Widget? leading;
  final Widget? trailing;

  /// You can custom component inside more option
  /// using [customMore]
  final Row? customMore;

  final VoidCallback? onTap;
  final VoidCallback? onTapOption1;
  final VoidCallback? onTapOption2;
  final VoidCallback? onTapOption3;
  final VoidCallback? onTapMore;

  final bool? more;
  final bool? isOpenMore;

  final Widget? iconMore1;
  final Widget? iconMore2;
  final Widget? iconMore3;

  final MoreOptionType? moreOptionType;

  final Widget? iconSubtitles;

  const CustomListTile(
      {Key? key,
      required this.title,
      this.sizeTitle,
      this.colorTitle,
      this.subtitle,
      this.subtitles,
      this.subsubtitles,
      this.subtitles2,
      this.subtitles3,
      this.subtitles4,
      this.subsubtitles2,
      this.subsubtitles3,
      this.subsubtitles4,
      this.colorSubtitle,
      this.colorSubtitles,
      this.colorSubtitles2,
      this.colorSubtitles3,
      this.colorSubtitles4,
      this.colorSubsubtitles,
      this.colorSubsubtitles2,
      this.colorSubsubtitles3,
      this.colorSubsubtitles4,
      this.colortrailingText,
      this.subtitle2,
      this.colorSubtitle2,
      this.subtitle3,
      this.colorSubtitle3,
      this.subtitle4,
      this.colorSubtitle4,
      this.colorBgStatus,
      this.colorStatus,
      this.height = 0.0,
      this.subtitleSize,
      this.splashColor,
      this.highlightColor,
      this.borderRadiusInk,
      this.status,
      this.trailingText,
      this.titleMore1,
      this.titleMore2,
      this.titleMore3,
      this.leading,
      this.trailing,
      this.customMore,
      this.onTap,
      this.onTapOption1,
      this.onTapOption2,
      this.onTapOption3,
      this.onTapMore,
      this.more,
      this.isOpenMore,
      this.iconMore1,
      this.iconMore2,
      this.iconMore3,
      this.moreOptionType = MoreOptionType.moreOptionTap,
      this.iconSubtitles})
      : super(key: key);

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  Widget _status(String value) {
    String status = value;
    Color color = Palette.n0;
    for (var i = 0; i < colors.length; i++) {
      if (value == colors[i]["key"]) {
        color = Palette.hexToColor(colors[i]["value"]);
      }
    }

    switch (value) {
      case "0":
        status = "Inactive";
        break;
      case "1":
        status = "Active";
        break;
      case "Subscribe":
        status = "Active";
        break;
      default:
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: widget.colorBgStatus ?? color.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Text(
        status,
        style: TextStyle(
            fontFamily: 'Mulish',
            color: widget.colorStatus ?? color,
            fontSize: 9.72,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  List<Widget> trailing() {
    return [
      if (widget.trailingText != null)
        Padding(
          padding: EdgeInsets.only(
              bottom: GlobalFunctions.isNullOrBlank(widget.status) ? 0 : 12),
          child: Text(
            widget.trailingText ?? '',
            style: TextStyle(
                fontFamily: 'Mulish',
                color: widget.colortrailingText ?? Palette.n70,
                fontSize: 14.0,
                fontWeight: FontWeight.w600),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        )
      else
        const SizedBox(),
      widget.trailing ?? Container(),
      GlobalFunctions.isNullOrBlank(widget.status)
          ? Container()
          : _status(widget.status ?? ''),
    ];
  }

  /// Access More Option from three dot option
  Widget moreOption() {
    if (widget.customMore == null) {
      return Flexible(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: TextButton(
                onPressed: widget.onTapOption1,
                style: TextButton.styleFrom(backgroundColor: Palette.n10),
                child: SizedBox(
                  height: widget.height != 0.0 ? widget.height : 71.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      widget.iconMore1 ?? const SizedBox(),
                      Container(
                        width: 6,
                      ),
                      Text(
                        widget.titleMore1 ?? "",
                        style: TextStyle(
                          fontFamily: 'Mulish',
                          fontSize: FontSize.size14,
                          fontWeight: FontWeight.w600,
                          color: Palette.n70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextButton(
                onPressed: widget.onTapOption2 ?? () {},
                style: TextButton.styleFrom(backgroundColor: Palette.n10),
                child: SizedBox(
                  height: widget.height != 0.0 ? widget.height : 71.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.iconMore2 ?? const SizedBox(),
                      Container(
                        width: 6,
                      ),
                      Text(
                        widget.titleMore2 ?? "",
                        style: TextStyle(
                          fontFamily: 'Mulish',
                          fontSize: FontSize.size14,
                          fontWeight: FontWeight.w600,
                          color: Palette.n70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Flexible(child: widget.customMore ?? Container());
    }
  }

  /// Access More Option from tapping component list
  Widget moreOptionTap() {
    if (widget.customMore == null) {
      return Row(
        children: [
          Expanded(
            flex: 2,
            child: TextButton(
              onPressed: widget.onTapOption1 ?? () {},
              style: TextButton.styleFrom(backgroundColor: Palette.n10),
              child: SizedBox(
                height: widget.height != 0.0 ? widget.height : 71.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.iconMore1 ?? const SizedBox(),
                    Container(
                      width: 6,
                    ),
                    Text(
                      widget.titleMore1 ?? "",
                      style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: FontSize.size14,
                        fontWeight: FontWeight.w600,
                        color: Palette.n70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: TextButton(
              onPressed: widget.onTapOption2 ?? () {},
              style: TextButton.styleFrom(backgroundColor: Palette.n10),
              child: SizedBox(
                height: widget.height != 0.0 ? widget.height : 71.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.iconMore2 ?? const SizedBox(),
                    Container(
                      width: 6,
                    ),
                    Text(
                      widget.titleMore2 ?? "",
                      style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: FontSize.size14,
                        fontWeight: FontWeight.w600,
                        color: Palette.n70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: TextButton(
              onPressed: widget.onTapOption3 ?? () {},
              style: TextButton.styleFrom(backgroundColor: Palette.n10),
              child: SizedBox(
                height: widget.height != 0.0 ? widget.height : 71.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.iconMore3 ?? const SizedBox(),
                    Container(
                      width: 6,
                    ),
                    Text(
                      widget.titleMore3 ?? "",
                      style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: FontSize.size14,
                        fontWeight: FontWeight.w600,
                        color: Palette.n70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return widget.customMore ?? Container();
    }
  }

  Widget _more() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        AnimatedPositioned(
          duration: const Duration(milliseconds: 250),
          left: widget.isOpenMore! ? 0 : Get.width,
          width: Get.width,
          curve: Curves.linear,
          child: Row(
            children: [
              if (widget.more!)
                TextButton(
                  onPressed: widget.onTapMore,
                  style: TextButton.styleFrom(backgroundColor: Palette.d0),
                  child: SizedBox(
                    height: widget.height != 0.0 ? widget.height : 71.0,
                    child: Icon(
                      Icons.chevron_right,
                      color: Palette.d40,
                    ),
                  ),
                ),
              moreOption(),
            ],
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 250),
          left: widget.isOpenMore! ? -Get.width : 0,
          width: Get.width,
          curve: Curves.linear,
          child: _component(),
        ),
      ],
    );
  }

  Widget _component() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, .0, 16.0),
      child: Row(
        children: <Widget>[
          Visibility(
            visible: widget.leading != null,
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: widget.leading,
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: widget.subtitle != null ? 8.0 : 0.0),
                  child: Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: FontSize.size14,
                      fontWeight: FontWeight.w600,
                      color: widget.colorTitle ?? Palette.n70,
                    ),
                  ),
                ),
                if (widget.subtitle != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      widget.iconSubtitles == null
                          ? RichText(
                              text: TextSpan(
                                text: widget.subtitle ?? "",
                                style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: FontSize.size12,
                                  fontWeight: FontWeight.w600,
                                  color: widget.colorSubtitle ?? Palette.n40,
                                ),
                                children: [
                                  TextSpan(
                                    text: widget.subtitles ?? "",
                                    style: TextStyle(
                                        fontFamily: 'Mulish',
                                        fontSize: FontSize.size12,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            colorSubtitles(widget.subtitles)),
                                  ),
                                  TextSpan(
                                    text: widget.subsubtitles ?? "",
                                    style: TextStyle(
                                        fontFamily: 'Mulish',
                                        fontSize: FontSize.size12,
                                        fontWeight: FontWeight.w600,
                                        color: colorSubtitles(
                                            widget.subsubtitles)),
                                  ),
                                ],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          : Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          widget.subtitle ?? "",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: FontSize.size12,
                                            fontWeight: FontWeight.w600,
                                            color: Palette.n40,
                                          ),
                                        ),
                                      ),
                                      widget.iconSubtitles ?? const SizedBox(),
                                    ],
                                  ),
                                ),
                                Text(
                                  widget.subtitles ?? "",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: 'Mulish',
                                      fontSize: FontSize.size12,
                                      fontWeight: FontWeight.w600,
                                      color: colorSubtitles(widget.subtitles)),
                                ),
                              ],
                            ),
                      if (widget.subtitle2 != null)
                        const SizedBox(
                          height: 4,
                        )
                      else
                        const SizedBox(),
                      if (widget.subtitle2 != null)
                        RichText(
                          text: TextSpan(
                            text: widget.subtitle2 ?? "",
                            style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: FontSize.size12,
                              fontWeight: FontWeight.w600,
                              color: Palette.n40,
                            ),
                            children: [
                              TextSpan(
                                text: widget.subtitles2 ?? "",
                                style: TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: FontSize.size12,
                                    fontWeight: FontWeight.w600,
                                    color: colorSubtitles(widget.subtitles2)),
                              ),
                              TextSpan(
                                text: widget.subsubtitles2 ?? "",
                                style: TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: FontSize.size12,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        colorSubtitles(widget.subsubtitles2)),
                              ),
                            ],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      else
                        const SizedBox(),
                      if (widget.subtitle3 != null)
                        const SizedBox(
                          height: 4,
                        )
                      else
                        const SizedBox(),
                      if (widget.subtitle3 != null)
                        RichText(
                          text: TextSpan(
                            text: widget.subtitle3 ?? "",
                            style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: FontSize.size12,
                              fontWeight: FontWeight.w600,
                              color: Palette.n40,
                            ),
                            children: [
                              TextSpan(
                                text: widget.subtitles3 ?? "",
                                style: TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: FontSize.size12,
                                    fontWeight: FontWeight.w600,
                                    color: colorSubtitles(widget.subtitles3)),
                              ),
                              TextSpan(
                                text: widget.subsubtitles3 ?? "",
                                style: TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: FontSize.size12,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        colorSubtitles(widget.subsubtitles3)),
                              ),
                            ],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      else
                        const SizedBox(),
                      if (widget.subtitle4 != null)
                        const SizedBox(
                          height: 4,
                        )
                      else
                        const SizedBox(),
                      if (widget.subtitle4 != null)
                        RichText(
                          text: TextSpan(
                            text: widget.subtitle4 ?? "",
                            style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: FontSize.size12,
                              fontWeight: FontWeight.w600,
                              color: Palette.n40,
                            ),
                            children: [
                              TextSpan(
                                text: widget.subtitles4 ?? "",
                                style: TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: FontSize.size12,
                                    fontWeight: FontWeight.w600,
                                    color: colorSubtitles(widget.subtitles4)),
                              ),
                              TextSpan(
                                text: widget.subsubtitles4 ?? "",
                                style: TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: FontSize.size12,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        colorSubtitles(widget.subsubtitles4)),
                              ),
                            ],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      else
                        const SizedBox(),
                    ],
                  ),
              ],
            ),
          ),
          // Spacer(),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Flexible(
                  child: Visibility(
                    visible: trailing().isNotEmpty,
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: widget.more == true ? 0 : 16.0),
                      child: Column(
                        mainAxisAlignment:
                            trailing().isNotEmpty && trailing().length == 1
                                ? MainAxisAlignment.center
                                : MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: trailing(),
                      ),
                    ),
                  ),
                ),
                if (widget.more == true)
                  const SizedBox(width: 8.0)
                else
                  const SizedBox(),
                if (widget.more == true)
                  InkWell(
                    onTap: widget.onTapMore,
                    child: SizedBox(
                      width: 56.0,
                      height: widget.height != 0.0 ? widget.height : 71.0,
                      child: Icon(
                        Icons.more_horiz,
                        color: Palette.n50,
                      ),
                    ),
                  )
                else
                  const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: widget.onTap ?? () {},
          splashColor: widget.splashColor,
          highlightColor: widget.highlightColor,
          borderRadius: widget.borderRadiusInk,
          child: Container(
            height: widget.height != 0.0 ? widget.height : 72.0,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(
                  color: Palette.n20,
                ),
              ),
            ),
            child: widget.moreOptionType == MoreOptionType.moreOption
                ? _more()
                : _component(),
          ),
        ),
        if (widget.moreOptionType == MoreOptionType.moreOptionTap)
          Visibility(
            visible: widget.isOpenMore ?? false,
            child: moreOptionTap(),
          ),
      ],
    );
  }
}
