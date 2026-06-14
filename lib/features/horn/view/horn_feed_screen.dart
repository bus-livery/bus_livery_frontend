import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cwidgets/ww_error_handler.dart';
import 'package:livery/features/horn/application/horn_bloc.dart';
import 'package:livery/features/horn/model/horn_model.dart';
import 'package:livery/features/horn/widget/horn_list_item.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/custom_print.dart';

class HornFeedScreen extends StatelessWidget {
  const HornFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HornBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/buss_logo.png', height: 70),
        centerTitle: true,
      ),
      body: Padding(
        padding: AppSize.swPadding,
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<HornBloc, HornState>(
                buildWhen: (p, c) => p.getAllHornsRes != c.getAllHornsRes,
                builder: (context, state) {
                  customPrint('BLOC BUILDER - HornFeedScreen');
                  List<HornModel>? hornsData = state.getAllHornsRes.apiData?.data;

                  return WWResponseHandler(
                    data: state.getAllHornsRes,
                    apiCall: () async {
                      context.read<HornBloc>().add(FetchAllHornsApiEvent());
                    },
                    isEmpty: hornsData?.isEmpty ?? true,
                    child: ListView.separated(
                      controller: bloc.listViewController,
                      itemCount: (hornsData?.length ?? 0) +
                          (state.getAllHornsRes.paginationLoading ? 1 : 0),
                      separatorBuilder: (context, index) => AppSize.sizedBox2h,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index == (hornsData?.length ?? 0)) {
                          return const Padding(
                            padding: EdgeInsets.all(16),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                        return HornListItem(horn: hornsData![index]);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
