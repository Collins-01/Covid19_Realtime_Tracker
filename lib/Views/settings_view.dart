import 'package:covid19_virus_tracker/ViewModels/setting_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (BuildContext context, model, child) {
        return SafeArea(
          child: Scaffold(
            body: Center(),
          ),
        );
      },
    );
  }
}
