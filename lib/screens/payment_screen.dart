import 'package:bus_tracking_management_system/utils/consts.dart';
import 'package:bus_tracking_management_system/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final List<Map<String, String>> paymentRecords = [
    {
      "Name": "John Doe",
      "Batch": "2023",
      "Amount Paid": "\$500",
      "Status": "Paid"
    },
    {
      "Name": "Jane Smith",
      "Batch": "2024",
      "Amount Paid": "\$300",
      "Status": "Unpaid"
    },
    {
      "Name": "Ali Khan",
      "Batch": "2022",
      "Amount Paid": "\$700",
      "Status": "Paid"
    },
    {
      "Name": "Sara Ali",
      "Batch": "2025",
      "Amount Paid": "\$400",
      "Status": "Partial"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      const CustomAppBar(
         title: "Payment Records",
        backgroundColor: AppColors.primary,
      ),
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "All Students Payment Records",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _buildPaymentTable(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Batch')),
          DataColumn(label: Text('Amount Paid')),
          DataColumn(label: Text('Status')),
        ],
        rows: paymentRecords
            .map(
              (record) => DataRow(cells: [
                DataCell(Text(record['Name']!)),
                DataCell(Text(record['Batch']!)),
                DataCell(Text(record['Amount Paid']!)),
                DataCell(Text(
                  record['Status']!,
                  style: TextStyle(
                    color: record['Status'] == 'Paid'
                        ? Colors.green
                        : record['Status'] == 'Unpaid'
                            ? Colors.red
                            : Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ]),
            )
            .toList(),
      ),
    );
  }
}
