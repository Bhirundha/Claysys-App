import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SwitchState extends Equatable{
  final bool switchValue;
  const SwitchState({required this.switchValue});

  @override
  List<Object> get props => [switchValue];
}

class SwitchInitial extends SwitchState{
  SwitchInitial({required bool switchValue}): super(switchValue: switchValue);
}