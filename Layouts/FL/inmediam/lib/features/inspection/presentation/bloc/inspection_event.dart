abstract class InspectionEvent {}

class LoadInspectionData extends InspectionEvent {}

class ToggleChecklistArea extends InspectionEvent {
  final String itemId;
  ToggleChecklistArea(this.itemId);
}

class AddMediaToItem extends InspectionEvent {
  final String itemId;
  final String mediaPath;
  AddMediaToItem(this.itemId, this.mediaPath);
}

class UpdateItemNotes extends InspectionEvent {
  final String itemId;
  final String notes;
  UpdateItemNotes(this.itemId, this.notes);
}