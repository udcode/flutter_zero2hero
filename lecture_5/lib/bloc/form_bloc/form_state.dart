
part of 'form_bloc.dart';
abstract class FormsState {}

class FormInitialState extends FormsState {}

class FormLoadingState extends FormsState {}

class FormLoadedState extends FormsState {
  final List<FormObj> forms;
  FormLoadedState(this.forms);


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FormLoadedState &&
      listEquals(other.forms, forms);
  }

  @override
  // TODO: implement hashCode
  int get hashCode => forms.hashCode;

}

class FormErrorState extends FormsState {
  final String message;
  FormErrorState(this.message);
}
