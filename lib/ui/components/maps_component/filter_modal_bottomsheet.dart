import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/category_poi_bloc/category_poi_bloc.dart';
import 'package:municipium/bloc/bloc/point_of_interest_list_bloc/point_of_interest_list_bloc.dart';
import 'package:municipium/bloc/cubit/selected_categories_cubit.dart/selected_categories_cubit.dart';
import 'package:municipium/ui/components/maps_component/custom_checkbox_tile.dart';

class FilterModalBottomSheet extends StatelessWidget {
  FilterModalBottomSheet(
      {super.key,
      required this.pointOfInterestBloc,
      required this.categoryPoiBloc,
      required this.categorySelectionCubit});
  PointOfInterestBloc pointOfInterestBloc;
  CategoryPoiBloc categoryPoiBloc;
  CategorySelectionCubit categorySelectionCubit;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          BlocBuilder<CategoryPoiBloc, CategoryPoiState>(
              bloc: categoryPoiBloc,
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
                                        : Theme.of(context).dividerColor,
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
            color: Theme.of(context).dividerColor,
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ButtonStyle(
                padding: WidgetStateProperty.all(const EdgeInsets.all(20)),
                backgroundColor:
                    WidgetStateProperty.all(Theme.of(context).primaryColor)),
            onPressed: () {
              pointOfInterestBloc.filterPoiList(
                categorySelectionCubit.state,
                pointOfInterestBloc.originalList!,
                categoryPoiBloc.categoryPoiList,
              );
              // Logica per applicare i filtri, es. aggiornare lista eventi
              Navigator.pop(context);
            },
            child: const Center(child: Text('Applica')),
          ),
        ],
      ),
    );
  }
}
