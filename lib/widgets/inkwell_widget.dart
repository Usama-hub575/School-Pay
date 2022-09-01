import 'package:flutter/material.dart';

class InkWellWidget extends StatefulWidget {
  Function onTap;
  Widget child;
  InkWellWidget({Key? key, required this.onTap, required this.child})
      : super(key: key);

  @override
  State<InkWellWidget> createState() => _InkWellWidgetState();
}

class _InkWellWidgetState extends State<InkWellWidget> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: InkWell(
        onTap: () => widget.onTap(),
        child: widget.child,
        splashColor: Colors.transparent,
      ),
    );
  }
}
