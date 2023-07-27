import 'package:bloc/bloc.dart';
import 'package:bstock/core/database/models/company.dart';
import 'package:injectable/injectable.dart';

import '../domain/company_repository.dart';

@injectable
class CompanyCubit extends Cubit<List<Company>> {
  final CompanyRepository companyRepository;

  CompanyCubit(this.companyRepository) : super([]);

  void fetchCompanies() async {
    final companies = await companyRepository.fetchCompanies();
    emit(companies);
  }
}
