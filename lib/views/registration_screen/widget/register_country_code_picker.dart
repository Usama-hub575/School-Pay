library country_code_picker;

import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paynest_flutter_app/res/res.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/custom_phone_number_field/selection_dialog.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../constants/constants.dart';
import '../../custom_phone_number_field/country_code.dart';
import '../../custom_phone_number_field/country_code_picker.dart';
import '../../custom_phone_number_field/country_codes.dart';

class RegisterCountryCodePicker extends StatefulWidget {
  final ValueChanged<CountryCode>? onChanged;
  final ValueChanged<CountryCode?>? onInit;
  final String? initialSelection;
  final List<String> favorite;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry padding;
  final bool showCountryOnly;
  final InputDecoration searchDecoration;
  final TextStyle? searchStyle;
  final TextStyle? dialogTextStyle;
  final WidgetBuilder? emptySearchBuilder;
  final Function(CountryCode?)? builder;
  final bool enabled;
  final TextOverflow textOverflow;
  final Icon closeIcon;

  /// Barrier color of ModalBottomSheet
  final Color? barrierColor;

  /// Background color of ModalBottomSheet
  final Color? backgroundColor;

  /// BoxDecoration for dialog
  final BoxDecoration? boxDecoration;

  /// the size of the selection dialog
  final Size? dialogSize;

  /// Background color of selection dialog
  final Color? dialogBackgroundColor;

  /// used to customize the country list
  final List<String>? countryFilter;

  /// shows the name of the country instead of the dialcode
  final bool showOnlyCountryWhenClosed;

  /// aligns the flag and the Text left
  ///
  /// additionally this option also fills the available space of the widget.
  /// this is especially useful in combination with [showOnlyCountryWhenClosed],
  /// because longer country names are displayed in one line
  final bool alignLeft;

  /// shows the flag
  final bool showFlag;

  final bool hideMainText;

  final bool? showFlagMain;

  final bool? showFlagDialog;

  /// Width of the flag images
  final double flagWidth;

  /// Use this property to change the order of the options
  final Comparator<CountryCode>? comparator;

  /// Set to true if you want to hide the search part
  final bool hideSearch;

  /// Set to true if you want to show drop down button
  final bool showDropDownButton;

  /// [BoxDecoration] for the flag image
  final Decoration? flagDecoration;

  /// An optional argument for injecting a list of countries
  /// with customized codes.
  final List<Map<String, String>> countryList;

  Color borderColor;

  RegisterCountryCodePicker({
    this.onChanged,
    this.onInit,
    required this.borderColor,
    this.initialSelection,
    this.favorite = const [],
    this.textStyle,
    this.padding = const EdgeInsets.all(8.0),
    this.showCountryOnly = false,
    this.searchDecoration = const InputDecoration(),
    this.searchStyle,
    this.dialogTextStyle,
    this.emptySearchBuilder,
    this.showOnlyCountryWhenClosed = false,
    this.alignLeft = false,
    this.showFlag = true,
    this.showFlagDialog,
    this.hideMainText = false,
    this.showFlagMain,
    this.flagDecoration,
    this.builder,
    this.flagWidth = 32.0,
    this.enabled = true,
    this.textOverflow = TextOverflow.ellipsis,
    this.barrierColor,
    this.backgroundColor,
    this.boxDecoration,
    this.comparator,
    this.countryFilter,
    this.hideSearch = false,
    this.showDropDownButton = false,
    this.dialogSize,
    this.dialogBackgroundColor,
    this.closeIcon = const Icon(Icons.close),
    this.countryList = codes,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    List<Map<String, String>> jsonList = countryList;

    List<CountryCode> elements =
    jsonList.map((json) => CountryCode.fromJson(json)).toList();

    if (comparator != null) {
      elements.sort(comparator);
    }

    if (countryFilter != null && countryFilter!.isNotEmpty) {
      final uppercaseCustomList =
      countryFilter!.map((c) => c.toUpperCase()).toList();
      elements = elements
          .where((c) =>
      uppercaseCustomList.contains(c.code) ||
          uppercaseCustomList.contains(c.name) ||
          uppercaseCustomList.contains(c.dialCode))
          .toList();
    }

    return CountryCodePickerState(elements);
  }
}

class CountryCodePickerState extends State<RegisterCountryCodePicker> {
  CountryCode? selectedItem;
  List<CountryCode> elements = [];
  List<CountryCode> favoriteElements = [];

  CountryCodePickerState(this.elements);

  @override
  Widget build(BuildContext context) {

    Widget _widget;
    if (widget.builder != null)
      _widget = InkWell(
        onTap: showCountryCodePickerDialog,
        child: widget.builder!(selectedItem),
      );
    else {
      _widget = InkWell(
        onTap: ()=> widget.enabled ? showCountryCodePickerDialog() : null,
        child: Row(
          children:[
            if (widget.showFlagMain != null
                ? widget.showFlagMain!
                : widget.showFlag)
              Container(
                width: sizes.widthRatio * 28,
                height: sizes.heightRatio * 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      selectedItem!.flagUri!,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            horizontalSpacer(10),
            if (!widget.hideMainText)
              Text(
                widget.showOnlyCountryWhenClosed
                    ? selectedItem.toString()
                    : selectedItem!.toCountryStringOnly(),
                style: PayNestTheme.h2_12blueAccent.copyWith(
                  fontSize: sizes.fontRatio * 14,
                  fontFamily: 'montserratBold',
                  color: PayNestTheme.black,
                ),
              ),
            const Spacer(),
            if (widget.showDropDownButton)
              SvgPicture.asset(
                icArrowDown,
              ),
          ],
        ),
      );
    }
    return _widget;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    this.elements = elements.map((e) => e.localize(context)).toList();
    _onInit(selectedItem);
  }

  @override
  void didUpdateWidget(RegisterCountryCodePicker oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.initialSelection != widget.initialSelection) {
      if (widget.initialSelection != null) {
        selectedItem = elements.firstWhere(
                (e) =>
            (e.code!.toUpperCase() ==
                widget.initialSelection!.toUpperCase()) ||
                (e.dialCode == widget.initialSelection) ||
                (e.name!.toUpperCase() ==
                    widget.initialSelection!.toUpperCase()),
            orElse: () => elements[0]);
      } else {
        selectedItem = elements[0];
      }
      _onInit(selectedItem);
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.initialSelection != null) {
      selectedItem = elements.firstWhere(
              (e) =>
          (e.code!.toUpperCase() ==
              widget.initialSelection!.toUpperCase()) ||
              (e.dialCode == widget.initialSelection) ||
              (e.name!.toUpperCase() == widget.initialSelection!.toUpperCase()),
          orElse: () => elements[0]);
    } else {
      selectedItem = elements[0];
    }

    favoriteElements = elements
        .where((e) =>
    widget.favorite.firstWhereOrNull((f) =>
    e.code!.toUpperCase() == f.toUpperCase() ||
        e.dialCode == f ||
        e.name!.toUpperCase() == f.toUpperCase()) !=
        null)
        .toList();
  }

  void showCountryCodePickerDialog() {
    showModalBottomSheet(
      barrierColor: widget.barrierColor ?? PayNestTheme.black.withOpacity(0.1),
      backgroundColor: PayNestTheme.black.withOpacity(0.1),
      context: context,
      builder: (context) => Center(
        child: SelectionDialog(
          elements,
          favoriteElements,
          showCountryOnly: widget.showCountryOnly,
          emptySearchBuilder: widget.emptySearchBuilder,
          searchDecoration: widget.searchDecoration,
          searchStyle: widget.searchStyle,
          textStyle: widget.dialogTextStyle,
          boxDecoration: widget.boxDecoration,
          showFlag: widget.showFlagDialog != null
              ? widget.showFlagDialog
              : widget.showFlag,
          flagWidth: widget.flagWidth,
          flagDecoration: widget.flagDecoration,
          size: widget.dialogSize,
          backgroundColor: widget.dialogBackgroundColor,
          barrierColor: widget.barrierColor,
          hideSearch: widget.hideSearch,
          closeIcon: widget.closeIcon,
        ),
      ),
    ).then(
          (e) {
        if (e != null) {
          setState(() {
            selectedItem = e;
          });

          _publishSelection(e);
        }
      },
    );
  }

  void _publishSelection(CountryCode e) {
    if (widget.onChanged != null) {
      widget.onChanged!(e);
    }
  }

  void _onInit(CountryCode? e) {
    if (widget.onInit != null) {
      widget.onInit!(e);
    }
  }
}
