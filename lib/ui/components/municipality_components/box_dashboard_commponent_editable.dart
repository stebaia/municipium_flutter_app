import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BoxVerticalEditableDashboardComponents extends StatelessWidget {
  const BoxVerticalEditableDashboardComponents(
      {super.key,
      required this.name,
      this.isMandatory = false,
      required this.onEdit,
      required this.onRemove,
      this.isRemoved = false});
  final String name;
  final bool isMandatory;
  final bool isRemoved;
  final GestureTapCallback onEdit;
  final GestureTapCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return isRemoved
        ? _emptyWidgetContainer(context)
        : _completeWidgetContainer(context, name);
  }

  Widget _completeWidgetContainer(BuildContext context, String name) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(6),
          height: MediaQuery.of(context).size.height * 0.27,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(20)),
          child: Center(child: Text(name)),
        ),
        !isMandatory
            ? Container(
                margin: const EdgeInsets.all(6),
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * 0.45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: onRemove,
                        child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(40)),
                            child: const Center(child: Icon(Icons.remove)))),
                    InkWell(
                        onTap: onEdit,
                        child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(40)),
                            child: const Center(child: Icon(Icons.edit)))),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }

  Widget _emptyWidgetContainer(BuildContext context) {
    return InkWell(
      onTap: onEdit,
      child: Container(
        margin: const EdgeInsets.all(6),
        height: MediaQuery.of(context).size.height * 0.27,
        width: MediaQuery.of(context).size.width * 0.45,
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text('Aggiungi un widget'),
        ),
      ),
    );
  }
}

class BoxHorizzontalEditableDashboardComponents extends StatelessWidget {
  const BoxHorizzontalEditableDashboardComponents(
      {super.key,
      required this.name,
      this.isMandatory = false,
      required this.onEdit,
      required this.onRemove,
      this.isRemoved = false});
  final String name;
  final bool isMandatory;
  final bool isRemoved;
  final GestureTapCallback onEdit;
  final GestureTapCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return isRemoved ? _emptyWidgetContainer(context) : _completeHorizzotalWidget(context);
  }

  Widget _completeHorizzotalWidget(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          height: MediaQuery.of(context).size.height * 0.14,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(20)),
          child: Center(child: Text(name)),
        ),
        !isMandatory
            ? Container(
                margin: const EdgeInsets.all(6),
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: onRemove,
                        child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(40)),
                            child: const Center(child: Icon(Icons.remove)))),
                    const SizedBox(
                      width: 40,
                    ),
                    InkWell(
                        onTap: onEdit,
                        child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(40)),
                            child: const Center(child: Icon(Icons.edit)))),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }
  Widget _emptyWidgetContainer(BuildContext context) {
    return InkWell(
      onTap: onEdit,
      child: Container(
       
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          height: MediaQuery.of(context).size.height * 0.14,
          width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text('Aggiungi un widget'),
        ),
      ),
    );
  }

}
