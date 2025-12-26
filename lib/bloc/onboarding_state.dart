import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final int index;
  const OnboardingState(this.index);

  @override
  List<Object> get props => [index];
}
