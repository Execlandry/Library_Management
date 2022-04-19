import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../widgets/CustomText/custom_text.dart';

/// Example without datasource
// ignore: use_key_in_widget_constructors
class StudentsTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColor.active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: AppColor.lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 30),
      child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          // ignore: prefer_const_literals_to_create_immutables
          columns: [
            const DataColumn2(
              label: Text("Name"),
              size: ColumnSize.L,
            ),
            const DataColumn(
              label: Text('Location'),
            ),
            const DataColumn(
              label: Text('Rating'),
            ),
            const DataColumn(
              label: Text('Action'),
            ),
          ],
          rows: List<DataRow>.generate(
              15,
              (index) => DataRow(cells: [
                    DataCell(CustomText(
                      text: "Santos Enoque",
                      color: AppColor.black,
                    )),
                    DataCell(CustomText(
                      text: "New yourk city",
                      color: AppColor.black,
                    )),
                    DataCell(Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.deepOrange,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CustomText(
                          text: "4.5",
                          color: AppColor.black,
                        )
                      ],
                    )),
                    DataCell(Container(
                        decoration: BoxDecoration(
                          color: AppColor.light,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColor.active, width: .5),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        child: CustomText(
                          text: "Block",
                          color: AppColor.active.withOpacity(.7),
                          weight: FontWeight.bold,
                        ))),
                  ]))),
    );
  }
}
