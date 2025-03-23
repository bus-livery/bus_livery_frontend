import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/utils/custom_print.dart';
import 'package:livery/utils/styles.dart';

class WWWebDesCustomSearchDropDownRow<T> extends StatefulWidget {
  final String? title;
  final TextStyle? titleStyle;
  final double? width;
  final bool isExpanded;
  final bool? isMandatory;
  final List<T> itemsList;
  final Function() apiCall;
  final void Function(T?) onChanged;
  final String Function(T) itemName;
  final String? Function(T?)? validator;
  final String? selectedItem;
  final Function()? addListTap;
  final String? addListName;
  final bool loading; // New parameter for loading state
  final bool showSearch;
  final Color? mandatoryTextColor;
  final Function()? onClearSelection;
  final Widget? rightTitleWidget;

  final GlobalKey<DropdownSearchState>? dropDownKey;
  const WWWebDesCustomSearchDropDownRow({
    super.key,
    this.title,
    this.isMandatory = false,
    this.width,
    required this.isExpanded,
    required this.itemsList,
    this.dropDownKey,
    required this.itemName,
    required this.apiCall,
    required this.onChanged,
    this.validator,
    this.selectedItem,
    this.addListTap,
    this.addListName,
    this.loading = false,
    this.showSearch = true,
    this.mandatoryTextColor,
    this.onClearSelection,
    this.titleStyle,
    this.rightTitleWidget,
  });

  @override
  State<WWWebDesCustomSearchDropDownRow<T>> createState() =>
      _WWWebDesCustomSearchDropDownRowState<T>();
}

class _WWWebDesCustomSearchDropDownRowState<T>
    extends State<WWWebDesCustomSearchDropDownRow<T>> {
  @override
  void initState() {
    customPrint('DROP DOWN SEARCH INITSTATE');
    widget.apiCall();

    super.initState();
  }

  @override
  void dispose() {
    customPrint('DROP DOWN SEARCH DISPOSE');
    super.dispose();
  }

  bool _isOnchanged = false;

  void isOnChanged() {
    _isOnchanged = true;
    if (_isOnchanged == false) setState(() {});
  }

  @override
  void didUpdateWidget(covariant WWWebDesCustomSearchDropDownRow<T> oldWidget) {
    if (oldWidget.selectedItem != widget.selectedItem &&
        widget.selectedItem != null) {
      customPrint('DROP DOWN DID UPDATE WIDGET');

      _isOnchanged = false;
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WwText(text: widget.title ?? '', style: normalText()),
              if (widget.isMandatory == true)
                const Text(' *', style: TextStyle(color: Colors.red)),
              const Spacer(),
              if (widget.rightTitleWidget != null) widget.rightTitleWidget!,
            ],
          ),

        dropDownSearch(context, widget.showSearch),
      ],
    );
  }

  Widget dropDownSearch(BuildContext context, bool showSearch) {
    return SizedBox(
      height: 40,
      width: widget.width,
      child: Stack(
        children: [
          IgnorePointer(
            ignoring: widget.loading,
            child: DropdownSearch<T>(
              suffixProps: DropdownSuffixProps(
                clearButtonProps: ClearButtonProps(
                  icon: InkWell(
                    onTap: widget.onClearSelection,
                    child: Icon(Icons.close, color: Colors.red),
                  ),
                  isVisible: widget.onClearSelection != null,
                ),
              ),
              key: widget.dropDownKey,
              onChanged: (v) {
                widget.onChanged(v);
                isOnChanged();
              },
              validator: widget.validator,
              selectedItem:
                  widget.itemsList.isNotEmpty ? widget.itemsList[0] : null,
              itemAsString:
                  (T item) =>
                      _isOnchanged
                          ? widget.itemName(item)
                          : widget.selectedItem ?? '',
              compareFn: (i, s) => widget.itemName(i) == widget.itemName(s),
              items: (filter, infiniteScrollProps) async {
                return widget.itemsList;
              },
              decoratorProps: DropDownDecoratorProps(
                baseStyle: normalText(),
                decoration: tfInputDecoration(context: context),
              ),
              popupProps: PopupPropsMultiSelection.menu(
                menuProps: MenuProps(
                  backgroundColor:
                      Theme.of(context).colorScheme.surfaceContainer,
                ),
                itemBuilder: (context, item, isDisabled, isSelected) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: WwText(
                      text: widget.itemName(item),
                      textAlign: TextAlign.start,
                      style: normalText(),
                    ),
                  );
                },
                containerBuilder:
                    widget.addListTap == null
                        ? null
                        : (context, popupWidget) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(child: popupWidget),
                              ListTile(
                                tileColor: Theme.of(context).focusColor,
                                leading: Icon(
                                  Icons.add,
                                  color:
                                      Theme.of(
                                        context,
                                      ).colorScheme.onPrimaryContainer,
                                ),
                                title: WwText(
                                  text: widget.addListName ?? '',
                                  textAlign: TextAlign.start,
                                  style: normalText(),
                                ),
                                onTap: () {
                                  context.router.maybePop();
                                  widget.addListTap!();
                                },
                              ),
                            ],
                          );
                        },
                showSearchBox: showSearch,
                searchFieldProps: TextFieldProps(
                  cursorHeight: 18,
                  autofocus: true,
                  style: normalText(),
                  decoration: tfInputDecoration(
                    context: context,
                    isRequired: false,
                    labelText: 'search',
                  ),
                ),
                fit: FlexFit.loose,
                constraints: const BoxConstraints(maxHeight: 250),
              ),
            ),
          ),
          if (widget.loading) ...[Center(child: CupertinoActivityIndicator())],
        ],
      ),
    );
  }
}
