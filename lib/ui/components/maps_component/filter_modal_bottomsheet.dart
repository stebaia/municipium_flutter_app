import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:municipium/bloc/bloc/category_poi_bloc/category_poi_bloc.dart';
import 'package:municipium/bloc/cubit/selected_categories_cubit.dart/selected_categories_cubit.dart';
import 'package:municipium/bloc/bloc/point_of_interest_list_bloc/point_of_interest_list_bloc.dart';
import 'package:municipium/ui/components/maps_component/custom_checkbox_tile.dart';
import 'package:municipium/ui/pages/point_of_interest_section/point_of_interest_list_page.dart';
import 'package:municipium/utils/theme_helper.dart';

class FilterModalBottomSheet extends StatelessWidget {
  FilterModalBottomSheet(
      {super.key,
      required this.pointOfInterestListBloc,
      required this.categorySelectionCubit});

  CategoryPoiBloc pointOfInterestListBloc;
  CategorySelectionCubit categorySelectionCubit;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          BlocBuilder<CategoryPoiBloc, CategoryPoiState>(
              bloc: pointOfInterestListBloc,
              builder: (context, state) {
                if (state is FetchedCategoryPoiListState) {
                  if (categorySelectionCubit.state.isEmpty) {
                    categorySelectionCubit.initialize({
                      for (var item in state.listCategoryPoi) item.id!: false
                    });
                  }

                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Scrollbar(
                      child: ListView.builder(
                          itemCount: state.listCategoryPoi.length,
                          itemBuilder: (context, index) {
                            var category = state.listCategoryPoi[index];
                            return BlocBuilder<CategorySelectionCubit,
                                    Map<int, bool>>(
                                bloc: categorySelectionCubit,
                                builder: (context, selectedCategories) {
                                  return CustomCheckboxTile(
                                    color: category.color != null
                                        ? Color(int.parse(category.color!
                                            .replaceAll("#", "0xff")))
                                        : Colors.black,
                                    title: category.name!,
                                    initialValue:
                                        selectedCategories[category.id] ??
                                            false,
                                    onChanged: (bool? value) {
                                      if (value != null) {
                                        categorySelectionCubit.toggleSelection(
                                            category.id!, value);
                                      }
                                    },
                                  );
                                });
                          }),
                    ),
                  );
                } else {
                  return Container();
                }
              }),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 1,
          ),
          CustomCheckboxTile(
            title: 'Espandi ricerca in comunini limitrofi',
            initialValue: isExpanded,
            color: Theme.of(context).colorScheme.secondary,
            onChanged: (value) {
              
            },
          )
        ],
      ),
    );
  }
}
