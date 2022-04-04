part of 'config_bloc.dart';

@immutable
abstract class ConfigState extends Equatable{}

class ConfigInitial extends ConfigState {
  @override
  List<Object?> get props => throw [];
}

class ConfigLoadingState extends ConfigState {
  @override
  List<Object?> get props => throw [];
}

class ConfigLoadedState extends ConfigState {
  final Map<String, dynamic> config;

  ConfigLoadedState({required this.config});

  @override
  List<Object> get props => [config];
}
