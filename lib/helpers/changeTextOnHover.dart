import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/helpers/constants.dart';
import 'package:my_portfolio/helpers/responsiveLayout.dart';

class ChangeTextOnHover extends StatefulWidget {
  final String text;
  final Color color;
  final double fontSize;
  // You can also pass the translation in here if you want to
  ChangeTextOnHover({Key key, this.text, this.color, this.fontSize})
      : super(key: key);

  @override
  _ChangeTextOnHoverState createState() => _ChangeTextOnHoverState();
}

class _ChangeTextOnHoverState extends State<ChangeTextOnHover> {
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(0, -1.5, 0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (e) {
        _mouseEnter(true);
      },
      onExit: (e) {
        _mouseEnter(false);
      },
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: Center(
          child: Text(
            widget.text,
            maxLines: 1,
          ),
        ),
        style: TextStyle(
            color: _hovering ? ProfileColors.navbarItemColor : widget.color,
            fontWeight: FontWeight.normal,
            fontSize: _hovering
                ? ResponsiveLayout.isMediumScreen(context) ? 11 : 13
                : ResponsiveLayout.isMediumScreen(context)
                    ? widget.fontSize - 2
                    : widget.fontSize),
        // transform: _hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}
