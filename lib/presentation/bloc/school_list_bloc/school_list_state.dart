part of 'school_list_bloc.dart';

// ignore: must_be_immutable
class SchoolListState extends Equatable {
  SchoolListStatus status = SchoolListStatus.init;
  String errorMessage = '';
  List<Log> log = [];
  List<Log> searchResult = [];

  SchoolListState({
    this.status = SchoolListStatus.init,
    this.errorMessage = '',
    this.log = const [],
    this.searchResult = const [],
  });

  SchoolListState copyWith({
    SchoolListStatus? status,
    String? errorMessage,
    List<Log>? log,
    List<Log>? searchResult,
  }) {
    return SchoolListState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      log: log ?? this.log,
      searchResult: searchResult ?? this.searchResult,
    );
  }

  @override
  List<Object?> get props => [
        status,
        searchResult,
        errorMessage,
        log,
      ];
}
