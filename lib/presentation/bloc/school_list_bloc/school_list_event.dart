part of 'school_list_bloc.dart';

abstract class SchoolListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetSchoolList extends SchoolListEvent {}

class OnSearchChange extends SchoolListEvent {
  final String value;

  OnSearchChange({
    required this.value,
  });
}

class SchoolListLoading extends SchoolListEvent {}
