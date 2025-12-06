import 'package:calculator/controller/math_controller.dart';
import 'package:calculator/main.dart';
import 'package:calculator/screens/history_screen.dart';
import 'package:calculator/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({super.key});

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  bool switchValue = false;

  MathController controller = MathController();

  @override
  Widget build(BuildContext context) {
    // context
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
        child: Column(
          children: [
            AppBar(
              leading: Switch(
                activeTrackColor: const Color(0xFF2F303C).withAlpha(180),
                thumbColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return Colors.grey.shade700;
                  } else {
                    return Colors.red.shade100;
                  }
                }),
                thumbIcon: const WidgetStatePropertyAll(
                  Icon(Icons.dark_mode, color: Color(0xFF4B5EFC)),
                ),
                inactiveTrackColor: Colors.grey,
                value: themeNotifier.value == ThemeMode.dark,
                onChanged: (value) {
                  themeNotifier.value = value
                      ? themeNotifier.value = ThemeMode.dark
                      : ThemeMode.light;
                },
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HistoryScreen(results: controller.results),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.history,
                    color: !isDark
                        ? AppTheme.darkTheme.scaffoldBackgroundColor
                        : AppTheme.lightTheme.scaffoldBackgroundColor,
                  ),
                ),
              ],
              backgroundColor: isDark
                  ? AppTheme.darkTheme.scaffoldBackgroundColor
                  : AppTheme.lightTheme.scaffoldBackgroundColor,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                color: isDark
                    ? AppTheme.darkTheme.scaffoldBackgroundColor
                    : AppTheme.lightTheme.scaffoldBackgroundColor,
                child: FittedBox(
                  child: Text(
                    controller.equation,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                color: isDark
                    ? AppTheme.darkTheme.scaffoldBackgroundColor
                    : AppTheme.lightTheme.scaffoldBackgroundColor,
                child: Text(
                  controller.result,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            buildButtonRow(['C', '±', '%', '/'], isOperatorRow: true),
            buildButtonRow(['7', '8', '9', '+'], isOperatorRow: true),
            buildButtonRow(['4', '5', '6', '-'], isOperatorRow: true),
            buildButtonRow(['1', '2', '3', 'x'], isOperatorRow: true),
            buildButtonRow(['.', '0', '', '='], isOperatorRow: true),
          ],
        ),
      ),
    );
  }

  Widget buildButtonRow(List<String> texts, {bool isOperatorRow = false}) {
    return Row(
      children: texts.map((text) => _buildButton(text: text)).toList(),
    );
  }

  Widget _buildButton({required String text}) {
    bool isOpType = "+-x/=".contains(text);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: (isOpType && text != '')
                ? const Color(0xFF4B5EFC)
                : const Color(0xFF2D2F38),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            fixedSize: const Size(0, 70),
          ),
          onPressed: () {
            setState(() {
              switch (text) {
                case 'C':
                  controller.clear();
                  break;
                case '±':
                  controller.toggleSign();
                  break;
                case '=':
                  controller.evaluate();
                  break;
                case '':
                  controller.backSpace();
                  break;
                default:
                  if ("+-x/%".contains(text)) {
                    controller.addOperator(text);
                  } else {
                    controller.addNumber(text);
                  }
              }
            });
          },
          child: text == ''
              ? SvgPicture.asset('assets/images/backspace_icon.svg')
              : Text(text),
        ),
      ),
    );
  }
}
