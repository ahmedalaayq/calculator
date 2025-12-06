// import 'package:calculator/theme/app_theme.dart';
// import 'package:flutter/material.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final bool isDark;
//   final ValueChanged<bool> onThemeChanged;
//   final VoidCallback? onHistoryPressed;

//   const CustomAppBar({
//     super.key,
//     required this.title,
//     required this.isDark,
//     required this.onThemeChanged,
//     this.onHistoryPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: 4,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           bottom: Radius.circular(20),
//         ),
//       ),
//       backgroundColor: isDark
//           ? AppTheme.scaffoldColorDark
//           : AppTheme.primaryColor.withOpacity(0.9),
//       foregroundColor: isDark ? Colors.white : Colors.white,
//       title: Text(
//         title,
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           color: isDark ? Colors.white : Colors.white,
//           shadows: [
//             Shadow(
//               color: Colors.black26,
//               blurRadius: 4,
//               offset: Offset(2, 2),
//             ),
//           ],
//         ),
//       ),
//       leading: Switch(
//         activeTrackColor: AppTheme.primaryColor.withAlpha(180),
//         thumbColor: MaterialStateProperty.resolveWith((states) {
//           if (states.contains(MaterialState.selected)) {
//             return Colors.grey.shade700;
//           } else {
//             return AppTheme.primaryColor.withOpacity(0.8);
//           }
//         }),
//         thumbIcon: const MaterialStatePropertyAll(
//           Icon(Icons.dark_mode, color: Colors.white),
//         ),
//         inactiveTrackColor: Colors.grey,
//         value: isDark,
//         onChanged: onThemeChanged,
//       ),
//       actions: [
//         IconButton(
//           onPressed: onHistoryPressed,
//           icon: Icon(
//             Icons.history,
//             color: isDark ? Colors.white : Colors.white,
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);
// }
