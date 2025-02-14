import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monizo_app/core/constants/app_constants.dart';
import 'package:monizo_app/core/extensions/text_style_extensions.dart';
import 'package:monizo_app/core/theme/app_colors.dart';
import 'package:intl/intl.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({super.key});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  String? selectedName = AppConstants.expenseDropdownItems.first.name;
  TextEditingController amountController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  FocusNode amountFocusNode = FocusNode();

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

  String _formatAmount(String value) {
    if (value.isEmpty) return '';

    // Sadece sayıları temizle
    String numericValue = value.replaceAll(RegExp(r'[^\d]'), '');

    // Eğer değer boşsa veya sıfırsa, ,00 ile döndür
    if (numericValue.isEmpty || numericValue == '0') return '0,00';

    // Basamaklara ayır ve ,00 ekle
    final formatter = NumberFormat('#,###', 'tr_TR');
    return '${formatter.format(int.parse(numericValue))},00';
  }

  void _onAmountChanged(String value) {
    final formatted = _formatAmount(value);
    amountController.value = TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  @override
  void dispose() {
    amountFocusNode.dispose();
    amountController.dispose();
    super.dispose();
  }

  void _closeKeyboard() {
    amountFocusNode.unfocus(); // Klavyeyi kapat
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (amountFocusNode.hasFocus) {
            _closeKeyboard();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name Dropdown
              Text("NAME", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  if (amountFocusNode.hasFocus) {
                    _closeKeyboard();
                  }
                },
                child: DropdownButtonFormField<String>(
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
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Amount Input
              Text("AMOUNT", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextField(
                focusNode: amountFocusNode,
                textInputAction: TextInputAction.done,
                onChanged: _onAmountChanged,
                maxLines: 1,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: amountController,
                style: context.labelLarge14.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.14,
                ),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: AppColors.textGrey),
                  prefixText: "\$ ",
                  prefixStyle: context.labelLarge14.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        amountController.text = "";
                      });
                    },
                    child: Icon(Icons.close, color: AppColors.primary),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1.4,
                      color: AppColors.primary,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
                onSubmitted: (value) {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 16),

              // Date Picker
              Text("DATE", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  if (amountFocusNode.hasFocus) {
                    _closeKeyboard();
                  }
                  _selectDate(context);
                },
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
      ),
    );
  }
}
