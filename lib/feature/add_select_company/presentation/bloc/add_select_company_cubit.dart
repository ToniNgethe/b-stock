import 'package:bloc/bloc.dart';
import 'package:bstock/feature/add_select_company/presentation/bloc/add_select_company_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/company/domain/company_repository.dart';

@injectable
class AddSelectCompanyCubit extends Cubit<AddSelectCompanyState> {
  final CompanyRepository companyRepository;

  AddSelectCompanyCubit(this.companyRepository)
      : super(const AddSelectCompanyState.init());

  /// The function fetches companies and listens for updates, emitting the company
  /// or error state.
  void fetchCompanies() async {
    try {
      emit(const AddSelectCompanyState.loading());
      await Future.delayed(const Duration(seconds: 1));

      companyRepository.fetchAndListenForCompanyUpdates().listen((countries) {
        emit(AddSelectCompanyState.companies(countries));
      });
    } catch (e) {
      emit(AddSelectCompanyState.error(e.toString()));
    }
  }
}
