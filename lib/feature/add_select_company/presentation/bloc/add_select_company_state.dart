import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/database/models/company.dart';

part 'add_select_company_state.freezed.dart';

@freezed
class AddSelectCompanyState with _$AddSelectCompanyState {
  const factory AddSelectCompanyState.init() = AddSelectCompanyStateInit;

  const factory AddSelectCompanyState.loading() = AddSelectCompanyStateLoading;

  const factory AddSelectCompanyState.error(String error) =
      AddSelectCompanyStateError;

  const factory AddSelectCompanyState.companies(List<Company> companies) =
      AddSelectCompanyStateCompanies;
}
