part of 'config_bloc.dart';

@immutable
abstract class ConfigEvent extends Equatable{
}

class LoadConfigFromFirebaseEvent extends ConfigEvent {
  @override
  List<Object?> get props => throw [];
}

class LoadConfigToFirebaseEvent extends ConfigEvent {
  final String appTitle;
  final String themeMainColor;
  final String fontColor;
  final String designMainColor;
  final double padding;
  final int circularRadius;

  LoadConfigToFirebaseEvent({
    required this.appTitle,
    required this.themeMainColor,
    required this.fontColor,
    required this.designMainColor,
    required this.padding,
    required this.circularRadius
  });

  @override
  List<Object?> get props => throw [appTitle, themeMainColor, fontColor, designMainColor, padding, circularRadius];
}
