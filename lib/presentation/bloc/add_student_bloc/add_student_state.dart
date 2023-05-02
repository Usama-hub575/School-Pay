part of 'add_student_bloc.dart';

// ignore: must_be_immutable
class AddStudentState extends Equatable {
  AddStudentStatus status = AddStudentStatus.init;
  String errorMessage = 'Verification Failed';
  List<String> filters = ['Name', 'Account Number', 'Student ID'];

  String selectedFilter = '';
  List<StudentListRowData> searchResult = [];
  List<StudentListRowData> rowData = [];
  bool isExpanded = false;
  bool isSearchFieldEnable = false;
  bool isLoading = false;
  StudentListResponseModel studentListResponseModel =
      StudentListResponseModel.empty();
  AddStudentResponseModel addStudentResponseModel =
      AddStudentResponseModel.empty();

  AddStudentState({
    this.status = AddStudentStatus.init,
    this.errorMessage = 'Verification Failed',
    this.rowData = const [],
    required this.studentListResponseModel,
    required this.addStudentResponseModel,
    this.filters = const ['Name', 'Account Number', 'Student ID'],
    this.selectedFilter = '',
    this.searchResult = const [],
    this.isExpanded = false,
    this.isSearchFieldEnable = false,
    this.isLoading = false,
  });

  AddStudentState copyWith({
    AddStudentStatus? status,
    String? errorMessage,
    List<StudentListRowData>? rowData,
    StudentListResponseModel? studentListResponseModel,
    AddStudentResponseModel? addStudentResponseModel,
    List<String>? filters,
    List<StudentListRowData>? searchResult,
    String? selectedFilter,
    bool? isExpanded,
    bool? isLoading,
    bool? isSearchFieldEnable,
  }) {
    return AddStudentState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      rowData: rowData ?? this.rowData,
      searchResult: searchResult ?? this.searchResult,
      filters: filters ?? this.filters,
      isExpanded: isExpanded ?? this.isExpanded,
      isSearchFieldEnable: isSearchFieldEnable ?? this.isSearchFieldEnable,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      studentListResponseModel:
          studentListResponseModel ?? this.studentListResponseModel,
      addStudentResponseModel:
          addStudentResponseModel ?? this.addStudentResponseModel,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        selectedFilter,
        searchResult,
        rowData,
        isLoading,
        filters,
        isExpanded,
        isSearchFieldEnable,
        studentListResponseModel,
        addStudentResponseModel,
      ];
}
