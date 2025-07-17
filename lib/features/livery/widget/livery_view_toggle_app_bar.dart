import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/features/livery/application/livery_bloc.dart';
import 'package:livery/utils/app_colors.dart';

class LiveryViewToggleAppBar extends StatelessWidget {
  const LiveryViewToggleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LiveryBloc, LiveryState, int>(
      selector: (state) => state.gridColumns,
      builder: (context, gridColumns) {
        return IconButton(
          onPressed: () {
            // Toggle between 1 (list) and 2 (grid)
            final newColumns = gridColumns == 1 ? 2 : 1;
            context.read<LiveryBloc>().add(
              ToggleGridViewEvent(columns: newColumns),
            );
          },
          icon: Icon(
            gridColumns == 1 ? Icons.grid_view : Icons.view_list,
            color: AppColors.primary,
          ),
          tooltip: gridColumns == 1 ? 'Grid View' : 'List View',
        );
      },
    );
  }
}
