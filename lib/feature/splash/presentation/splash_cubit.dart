import 'package:bloc/bloc.dart';
import 'package:bstock/core/models/generic_cubit_state.dart';
import 'package:injectable/injectable.dart';

import '../../../core/company/domain/company_repository.dart';

@injectable
class SplashCubit extends Cubit<GenericCubitState> {
  final CompanyRepository companyRepository;

  SplashCubit(this.companyRepository) : super(const GenericCubitState.init());

  // check if default companies have been added
  // if not, add them
  void initApp() async {
    try {
      emit(const GenericCubitState.loading());
      await Future.delayed(const Duration(seconds: 1));

      await companyRepository.companiesAlreadyAdded();
      emit(const GenericCubitState.success("Success"));
    } catch (e) {
      emit(GenericCubitState.error(e.toString()));
    }
  }
}
