import 'package:inmediam/features/inspection/domain/entities/inspection.dart';

abstract class InspectionState {}

class InspectionInitial extends InspectionState {}

class InspectionLoading extends InspectionState {}

class InspectionLoaded extends InspectionState {
  final List<Property> properties;
  final List<InspectionItem> checklist;

  InspectionLoaded({
    required this.properties,
    required this.checklist,
  });

  InspectionLoaded copyWith({
    List<Property>? properties,
    List<InspectionItem>? checklist,
  }) {
    return InspectionLoaded(
      properties: properties ?? this.properties,
      checklist: checklist ?? this.checklist,
    );
  }
}