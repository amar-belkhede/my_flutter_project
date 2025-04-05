part of 'settings_cubit.dart';

abstract class SettingsState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SettingsLoading extends SettingsState {
  SettingsLoading();
}

final class SettingsError extends SettingsState {
  final String message;
  SettingsError(this.message);
  @override
  List<Object?> get props => [message];
}
final class SettingsSuccess extends SettingsState {
  SettingsSuccess();
  @override
  List<Object?> get props => [];
}