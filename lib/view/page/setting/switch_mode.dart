import 'package:blackrose/view/page/shared/dark_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwitchMode extends StatefulWidget {
  const SwitchMode({super.key});

  @override
  State<SwitchMode> createState() => _SwitchModeState();
}

class _SwitchModeState extends State<SwitchMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Chuyển đổi chế độ",
          style: TextStyle(
              color: Theme.of(context).primaryTextTheme.bodyLarge!.color),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Chuyển độ tối",
                  style: TextStyle(fontSize: 15),
                ),
                Switch(
                  value: Provider.of<ThemeProvider>(context, listen: false)
                      .isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme(context);
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
