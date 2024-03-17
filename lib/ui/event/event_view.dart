import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hkorn_new_dev_vijay/const/consts.dart';
import 'package:hkorn_new_dev_vijay/ui/event/event_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class EventView extends StatelessWidget {
  const EventView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EventViewModel>.reactive(
        viewModelBuilder: () => EventViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: BaseAppbar(
                title: "Events",
                context: context,
              ),
              body: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Container(
                        //   width: 60,
                        //   height: 75,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     color: BaseColors.primaryColor,
                        //   ),
                        //   child: Center(
                        //     child: Text(
                        //       "ALL",
                        //       style: BaseFonts.subHead(color: BaseColors.white),
                        //     ),
                        //   ),
                        // ),
                        // horizontalSpaceSmall,
                        // Expanded(
                        //   child: DatePicker(
                        //     model.selectedDate,

                        //     controller: model.datePickController,
                        //     initialSelectedDate: DateTime.now(),
                        //     selectionColor: BaseColors.primaryColor,
                        //     selectedTextColor: Colors.white,
                        //     // dateTextStyle: BaseFonts.subHead(
                        //     //     color: BaseColors.white, fontSize: 0),
                        //     dayTextStyle: BaseFonts.subHead(
                        //         color: BaseColors.white, fontSize: 0),
                        //     onDateChange: (date) =>
                        //         model.changeEventDateAndFetch(date),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  model.isBusy
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height / 1.5,
                          child: loadingSpinnerWidget,
                        )
                      : model.elements.isEmpty
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height / 1.5,
                              child: Center(
                                child: Text(
                                  "No Event Found!",
                                  style: BaseFonts.subHeadBold(),
                                ),
                              ),
                            )
                          : Expanded(
                              child: GroupedListView<dynamic, String>(
                                elements: model.elements,
                                groupBy: (element) => element['date'],
                                groupComparator: (value1, value2) =>
                                    value2.compareTo(value1),
                                itemComparator: (item1, item2) =>
                                    item1['name'].compareTo(item2['name']),
                                order: GroupedListOrder.ASC,
                                useStickyGroupSeparators: true,
                                padding: EdgeInsets.zero,
                                groupSeparatorBuilder: (String value) =>
                                    Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: sidePadding),
                                  child: Text(
                                    DateFormat.yMMMM()
                                        .format(DateTime.parse(value))
                                        .toUpperCase(),
                                    textAlign: TextAlign.left,
                                    style: BaseFonts.subHead(
                                      fontSize: 15,
                                    ).copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                itemBuilder: (c, element) {
                                  return GestureDetector(
                                    onTap: () =>
                                        model.goToDetail(element['event_id']),
                                    child: Card(
                                      color: const Color(0xffFAFAFA),
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.black12, width: 1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 0.0,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: sidePadding,
                                          vertical: 6.0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 1),
                                            child: Container(
                                              width: 3,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color:
                                                      BaseColors.primaryColor),
                                            ),
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              child: ListTile(
                                                leading: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                        DateFormat.d()
                                                            .format(DateTime
                                                                .parse(element[
                                                                        'date']
                                                                    .toString()))
                                                            .toUpperCase(),
                                                        style: BaseFonts
                                                            .subHead(
                                                          fontSize: 20,
                                                        ).copyWith(
                                                            color: const Color(
                                                                0xffABABAB),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                    Text(
                                                      DateFormat.MMM()
                                                          .format(DateTime
                                                              .parse(element[
                                                                      'date']
                                                                  .toString()))
                                                          .toUpperCase(),
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xffABABAB),
                                                          fontSize: 9),
                                                    )
                                                  ],
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20.0,
                                                        vertical: 5.0),
                                                title: Text(
                                                    element['name']
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: BaseFonts.subHead(
                                                      fontSize: 16,
                                                    ).copyWith(
                                                        color: const Color(
                                                            0xff6B6B6B),
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                // subtitle: element['date']
                                                //         .toString()
                                                //         .isEmpty
                                                //     ? null
                                                //     : Text(
                                                //         element['date'].toString()),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                ],
              ),
            ));
  }
}
