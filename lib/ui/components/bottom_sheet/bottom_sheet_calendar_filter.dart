import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/calendar_event_bloc/calendar_event_bloc_bloc.dart';
import 'package:municipium/bloc/cubit/calendar_filter_cubit/calendar_filter_cubit.dart';
import 'package:municipium/utils/calendar_utility.dart';
import 'package:municipium/utils/municipium_utility.dart';

class BottomSheetFilter extends StatelessWidget {
  const BottomSheetFilter({super.key, required this.filterIdList});
  final List<int> filterIdList;
  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Column(
          children: [
            const SizedBox(height: 70,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 30,),
                const Text('Filtri'),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
            BlocBuilder<FilterCubit, Set<FilterType>>(
              builder: (context, state) => Column(
                children: [
                  ...filterIdList.map((filter) => _buildFilterTile(
                      context,
                      CalendarUtility.getFilterFromType(filter),
                      CalendarUtility.getNameFromType(filter),
                      CalendarUtility.getColorFromType(filter),
                      state))
                ],
              ),
            ),
            const Spacer(),
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(const EdgeInsets.all(20)),
                        backgroundColor: WidgetStateProperty.all(Theme.of(context).primaryColor)
                      ),
                      onPressed: () {
                        context.read<FilterCubit>().clearFilters();
                      },
                      child: const Center(child: Text('Cancella')),
                      
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(const EdgeInsets.all(20)),
                        backgroundColor: WidgetStateProperty.all(Theme.of(context).primaryColor)
                      ),
                      onPressed: () {
                        context.read<FilterCubit>().applyFilters();
                        context.read<CalendarBloc>().fetchCalendarEvents(
                            date: MunicipiumUtility.getFirstDayOfMonth(),
                            endDate: MunicipiumUtility.getLastDayOfMonth(),
                            type: CalendarUtility.getIntFromFilter(context.read<FilterCubit>().state).toString()
                            );
                        // Logica per applicare i filtri, es. aggiornare lista eventi
                        Navigator.pop(context);
                      },
                      child: const Center(child: Text('Applica')),
                      
                    ),
                  ],
                ),
              ),
          ],
        ),
      
    );
  }

  Widget _buildFilterTile(BuildContext context, FilterType filterType,
      String label, Color color, Set<FilterType> activeFilters) {
    return CheckboxListTile(
      value: activeFilters.contains(filterType),
      onChanged: (isChecked) {
        context.read<FilterCubit>().toggleFilter(filterType);
      },
      controlAffinity: ListTileControlAffinity.leading, 
      title: Text(label),
      activeColor: color,
      checkColor: Colors.white,
    );
  }
}
