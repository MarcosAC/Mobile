import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inmediam/core/services/feedback_service.dart';
import 'package:inmediam/features/inspection/domain/entities/inspection.dart';
import 'package:inmediam/features/inspection/presentation/bloc/inspection_event.dart';
import 'package:inmediam/features/inspection/presentation/bloc/inspection_state.dart';

class InspectionBloc extends Bloc<InspectionEvent, InspectionState> {
  InspectionBloc() : super(InspectionInitial()) {
    on<LoadInspectionData>(_onLoadData);
    on<ToggleChecklistArea>(_onToggleChecklis);
    on<AddMediaToItem>(_onAddMedia);
    on<UpdateItemNotes>(_onUpdateNotes);
  }

  void _onLoadData(LoadInspectionData event, Emitter<InspectionState> emit) async {
    emit(InspectionLoading());
    await Future.delayed(const Duration(milliseconds: 800));

    final propertiesMock = [
      Property(
        title: "Casa Residencial - São Paulo",
        address: "Salen, 2.50",
        rooms: "4 Quartos | 2 Banheiros",
        status: "Pendente",
        imageUrl: "https://images.unsplash.com/photo-1580587771525-78b9dba3b914?w=500",
      ),
      Property(
        title: "Apartamento - Vila Madalena",
        address: "Rua Harmonia, 120",
        rooms: "2 Quartos | 1 Suíte",
        status: "Em Progresso",
        imageUrl: "https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=500",
      )
    ];

    final checklistMock = [
      InspectionItem(id: "1", name: "Cozinha", category: "Áreas de Inspeção"),
      InspectionItem(id: "2", name: "Quarto Principal", category: "Áreas de Inspeção"),
      InspectionItem(id: "3", name: "Banheiro Social", category: "Áreas de Inspeção"),
      InspectionItem(id: "4", name: "Garagem", category: "Áreas de Inspeção"),
    ];

    emit(InspectionLoaded(properties: propertiesMock, checklist: checklistMock));
  }
  
  FutureOr<void> _onToggleChecklis(ToggleChecklistArea event, Emitter<InspectionState> emit) {
    if (state is InspectionLoaded) {
      final currentState = state as InspectionLoaded;
      
      final updateList = currentState.checklist.map((item) {        
        if (item.id == event.itemId) {
          return item.copyWith(isChecked: !item.isChecked);
        }
        return item;
      }).toList();

      emit(currentState.copyWith(checklist: updateList));
      FeedbackService.showMessage("Status do item atualizado!", type: FeedbackType.success);
    }
  }
  
  FutureOr<void> _onAddMedia(AddMediaToItem event, Emitter<InspectionState> emit) {
    if (state is InspectionLoaded) {
      final currentState = state as InspectionLoaded;
      
      final updateList = currentState.checklist.map((item) {        
        if (item.id == event.itemId) {
          final newMedia = List<String>.from(item.attachments)..add(event.mediaPath);
          return item.copyWith(attachments: newMedia);
        }
        return item;
      }).toList();

      emit(currentState.copyWith(checklist: updateList));
      FeedbackService.showMessage("Mídia anexada com sucesso!", type: FeedbackType.success);
    }
  }
  
  FutureOr<void> _onUpdateNotes(UpdateItemNotes event, Emitter<InspectionState> emit) {
    if (state is InspectionLoaded) {
      final currentState = state as InspectionLoaded;
      
      final updateList = currentState.checklist.map((item) {        
        if (item.id == event.itemId) {
          return item.copyWith(notes: event.notes);
        }
        return item;
      }).toList();

      emit(currentState.copyWith(checklist: updateList));
    }
  }
}