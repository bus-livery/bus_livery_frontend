import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/ww_drop_down.dart';
import 'package:livery/features/livery_create/application/livery_create_bloc.dart';
import 'package:livery/features/livery_create/model/bus_type_model/bus_type_model.dart';

class BusTypeDropDown extends StatelessWidget {
  final bool? isMandatory;
  final String? title;
  final String? selectedItem;
  final Function(BusTypeModel?) onChanged;
  final String? Function(BusTypeModel?)? validator;
  const BusTypeDropDown({
    super.key,
    required this.selectedItem,
    required this.onChanged,
    this.validator,
    this.isMandatory,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LiveryCreateBloc, LiveryCreateState, ApiStatus>(
      selector: (state) => state.busTypesRes.status,
      bloc: BlocProvider.of<LiveryCreateBloc>(context),
      builder: (context, state) {
        final bloc = context.read<LiveryCreateBloc>();
        return WWWebDesCustomSearchDropDownRow<BusTypeModel>(
          apiCall: () {},
          isMandatory: isMandatory ?? true,
          validator: validator,
          title: title,
          showSearch: false,
          isExpanded: true,
          loading: bloc.state.busTypesRes.status == ApiStatus.loading,
          selectedItem: selectedItem,
          itemsList: bloc.state.busTypesRes.apiData ?? [],
          itemName: (v) => v.busType ?? '',
          onChanged: onChanged, //=> customerB.area = v!,
        );
      },
    );
  }
}

class BusModelsDropDown extends StatelessWidget {
  final bool? isMandatory;
  final String? title;
  final String? selectedItem;
  final Function(String?) onChanged;
  final String? Function(String?)? validator;
  const BusModelsDropDown({
    super.key,
    this.selectedItem,
    required this.onChanged,
    this.validator,
    this.isMandatory,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LiveryCreateBloc, LiveryCreateState, List<String>>(
      selector: (state) => state.busModels,
      bloc: BlocProvider.of<LiveryCreateBloc>(context),
      builder: (context, state) {
        return WWWebDesCustomSearchDropDownRow<String>(
          apiCall: () {},
          isMandatory: isMandatory ?? true,
          validator: validator,
          title: title,
          showSearch: false,
          isExpanded: true,
          selectedItem: selectedItem ?? (state.isEmpty ? '' : state.first),
          itemsList: state,
          itemName: (v) => v,
          onChanged: onChanged, //=> customerB.area = v!,
        );
      },
    );
  }
}
