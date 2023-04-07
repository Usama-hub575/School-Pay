import 'package:paynest_flutter_app/export.dart';

class InkWellWidget extends StatefulWidget {
  final Function onTap;
  final Widget child;

  const InkWellWidget({Key? key, required this.onTap, required this.child})
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
        splashColor: Colors.transparent,
        child: widget.child,
      ),
    );
  }
}
