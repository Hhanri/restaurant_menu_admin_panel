part of 'config_bloc.dart';

@immutable
abstract class ConfigState {}

class ConfigInitial extends ConfigState {}

class ConfigLoadingState extends ConfigState {}

class ConfigLoadedState extends ConfigState {
  final Map<String, dynamic> config;

  ConfigLoadedState({required this.config});

  @override
  List<Object> get props => [config];
}
