import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../app/providers/theme_mode_provider.dart';

class ThemeToggle extends StatefulWidget {
  const ThemeToggle({super.key});

  @override
  State<ThemeToggle> createState() => _ThemeToggleState();
}
class _ThemeToggleState extends State<ThemeToggle> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeProvider>(
        builder: (context, themeModeProvider, _) {
          return DropdownButton<ThemeMode>(
              value:themeModeProvider  .themeMode ,
              items: [
                DropdownMenuItem(
                    value: ThemeMode.system,
                    child: Text('System')),
                DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text('light')),
                DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: Text('dark'))
              ],
              onChanged: (newMode){
                context.read<ThemeModeProvider>().changeThemeMode(newMode!);
              });
        }
    );
  }
}