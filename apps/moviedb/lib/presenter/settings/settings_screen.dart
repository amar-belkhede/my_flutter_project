import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/di/configure_dependency.dart';
import 'package:moviedb/presenter/settings/cubit/settings_cubit.dart';
import 'package:network_service/model/language_response.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingsCubit _settingsCubit = getIt<SettingsCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _settingsCubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      bloc: _settingsCubit,
      builder: (context, state) {
        if (state is SettingsError) {
          return Center(child: Text(state.message));
        }
        if (state is SettingsSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Settings"),
            ),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: DropdownButtonFormField<LanguageResponse>(
                    padding: const EdgeInsets.all(8),
                    decoration: const InputDecoration(
                      labelText: "Language",
                      border: OutlineInputBorder(),
                    ),
                    value: _settingsCubit.selectedLanguage,
                    items: _settingsCubit.languages.map((language) {
                      return DropdownMenuItem<LanguageResponse>(
                        value: language,
                        child: Text(language.englishName ?? ""),
                      );
                    }).toList(),
                    onChanged: (value) {
                      _settingsCubit.setLanguage(value!);
                    },
                    menuMaxHeight: 300,
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
