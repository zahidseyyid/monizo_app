import 'package:flutter/material.dart';
import 'package:monizo_app/core/constants/app_constants.dart';
import 'package:monizo_app/core/theme/app_colors.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({super.key});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  String? selectedName = AppConstants.expenseDropdownItems.first.name;
  String amount = "\$48.00";
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      locale: const Locale('tr'),
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name Dropdown
            Text("NAME", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedName,
              items: AppConstants.expenseDropdownItems
                  .map((item) => item.name)
                  .toSet()
                  .map((name) => DropdownMenuItem(
                        value: name,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.cardGreen,
                              backgroundImage: AssetImage(
                                  'assets/images/notification-icon.png'),
                              radius: 10,
                            ),
                            SizedBox(width: 8),
                            Text(name),
                          ],
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedName = value;
                });
              },
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),

            SizedBox(height: 16),

            // Amount Input
            Text("AMOUNT", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: amount,
                    onChanged: (value) {
                      setState(() {
                        amount = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      amount = "";
                    });
                  },
                  child: Text("Clear"),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Date Picker
            Text("DATE", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: TextStyle(fontSize: 16),
                    ),
                    Icon(Icons.calendar_today, size: 20),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
