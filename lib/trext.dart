library trext;

import 'package:flutter/material.dart';

class Trext extends StatefulWidget {
  final String str;
  final double size, headingSize;
  final bool bold,
      shadow,
      isDynamicString,
      isHeading,
      isSubHeading,
      showUnderline;
  final Color? color;
  final String? fontFamily, dynamicString;
  final TextAlign? align;
  final TextOverflow? overflow;
  final TextStyle? style;
  final String? prefix;
  final TextDecoration? prefixDecoration;

  ///Trext - Translated Text
  const Trext(
    this.str, {
    Key? key,
    this.size = 15.0,
    this.headingSize = 18.0,
    this.bold = false,
    this.shadow = false,
    this.color,
    this.fontFamily,
    this.isDynamicString = false,
    this.showUnderline = false,
    this.dynamicString,
    this.align,
    this.isHeading = false,
    this.isSubHeading = false,
    this.overflow,
    this.prefix,
    this.prefixDecoration,
    this.style,
  }) : super(key: key);

  @override
  State<Trext> createState() => _TrextState();
}

class _TrextState extends State<Trext> {
  @override
  Widget build(BuildContext context) {
    var text = widget.isDynamicString
        ? '${widget.dynamicString ?? ''}${widget.str}'
        : widget.str;
    var textStyle = widget.style ??
        (widget.isHeading
            ? TextStyle(
                fontSize: widget.headingSize,
                fontWeight: FontWeight.w700,
                color: widget.color ?? Colors.grey[800],
                decoration:
                    widget.showUnderline ? TextDecoration.underline : null,
              )
            : widget.isSubHeading
                ? TextStyle(
                    fontSize: widget.size,
                    fontWeight: FontWeight.w700,
                    color: widget.color ?? Colors.black87,
                    decoration:
                        widget.showUnderline ? TextDecoration.underline : null,
                  )
                : TextStyle(
                    shadows: widget.shadow ? textStrokeLikeShadow() : null,
                    fontFamily: widget.fontFamily,
                    fontSize: widget.size,
                    fontWeight: widget.bold ? FontWeight.bold : null,
                    color: widget.color,
                    decoration:
                        widget.showUnderline ? TextDecoration.underline : null,
                  ));

    if (widget.prefix != null && widget.prefix!.isNotEmpty) {
      return Row(
        children: [
          Text(
            widget.prefix!,
            overflow: widget.overflow,
            style: textStyle.copyWith(decoration: widget.prefixDecoration),
            textAlign: widget.align,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            overflow: widget.overflow,
            style: textStyle,
            textAlign: widget.align,
          )
        ],
      );
    }
    return Text(
      text,
      overflow: widget.overflow,
      style: textStyle,
      textAlign: widget.align,
    );
  }

  List<Shadow> textStrokeLikeShadow() {
    return const [
      Shadow(
          // bottomLeft
          offset: Offset(-1.5, -1.5),
          color: Colors.white60),
      Shadow(
          // bottomRight
          offset: Offset(1.5, -1.5),
          color: Colors.white60),
      Shadow(
          // topRight
          offset: Offset(1.5, 1.5),
          color: Colors.white60),
      Shadow(
          // topLeft
          offset: Offset(-1.5, 1.5),
          color: Colors.white60),
    ];
  }
}
