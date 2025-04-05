import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:moviedb/repository/movie_repository.dart';
import 'package:moviedb/secure_storage.dart';
import 'package:network_service/model/language_response.dart';

part 'settings_state.dart';

@lazySingleton
class SettingsCubit extends Cubit<SettingsState> {
  final MovieRepository _movieRepositoryImpl;
  List<LanguageResponse> languages = [];
  late LanguageResponse selectedLanguage;

  SettingsCubit(this._movieRepositoryImpl) : super(SettingsLoading()) {
    initialize();
  }

  initialize() async {
    emit(SettingsLoading());
    try {
      await _fetchLanguage();
      var tmpLang = await Storage().getLanguage();
      selectedLanguage = languages.firstWhere(
        (element) {
          return element.englishName == tmpLang.englishName;
        },
      );
      emit(SettingsSuccess());
    } on Exception {
      emit(SettingsError("Someting went wrong"));
    }
  }

  Future<bool> _fetchLanguage() async {
    languages = await _movieRepositoryImpl.getLanguages();
    languages.sort((a, b) {
      return a.englishName!.compareTo(b.englishName!);
    });

    return true;
  }

  void setLanguage(LanguageResponse language) async {
    selectedLanguage = language;
    await Storage().setLanguage(language.toJson());
    emit(SettingsSuccess());
  }
}
