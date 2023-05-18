// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:expense_tracker/data/database/app_database.dart' as _i3;
import 'package:expense_tracker/data/database/dao/budget_dao.dart' as _i4;
import 'package:expense_tracker/data/database/dao/category_dao.dart' as _i8;
import 'package:expense_tracker/data/database/dao/statistics_dao.dart' as _i14;
import 'package:expense_tracker/data/database/dao/transaction_dao.dart' as _i17;
import 'package:expense_tracker/data/database/dao/wallet_dao.dart' as _i21;
import 'package:expense_tracker/data/database/models/budgets.dart' as _i26;
import 'package:expense_tracker/data/database/models/categories.dart' as _i12;
import 'package:expense_tracker/data/database/models/wallets.dart' as _i29;
import 'package:expense_tracker/data/repository/budget_repository_impl.dart'
    as _i6;
import 'package:expense_tracker/data/repository/category_repository_impl.dart'
    as _i10;
import 'package:expense_tracker/data/repository/statistics_repository_impl.dart'
    as _i16;
import 'package:expense_tracker/data/repository/transaction_repository_impl.dart'
    as _i19;
import 'package:expense_tracker/data/repository/wallet_repository_impl.dart'
    as _i23;
import 'package:expense_tracker/domain/repository/budget_repository.dart'
    as _i5;
import 'package:expense_tracker/domain/repository/category_repository.dart'
    as _i9;
import 'package:expense_tracker/domain/repository/statistics_repository.dart'
    as _i15;
import 'package:expense_tracker/domain/repository/transaction_repository.dart'
    as _i18;
import 'package:expense_tracker/domain/repository/wallet_repository.dart'
    as _i22;
import 'package:expense_tracker/presentation/pages/add_transaction/bloc/add_transaction_bloc.dart'
    as _i27;
import 'package:expense_tracker/presentation/pages/budgets/add_budget/bloc/add_budget_bloc.dart'
    as _i25;
import 'package:expense_tracker/presentation/pages/budgets/bloc/budgets_bloc.dart'
    as _i7;
import 'package:expense_tracker/presentation/pages/create_category/bloc/create_category_bloc.dart'
    as _i11;
import 'package:expense_tracker/presentation/pages/home/bloc/home_bloc.dart'
    as _i30;
import 'package:expense_tracker/presentation/pages/main/bloc/main_bloc.dart'
    as _i13;
import 'package:expense_tracker/presentation/pages/statistics/bloc/statistics_bloc.dart'
    as _i31;
import 'package:expense_tracker/presentation/pages/transactions/bloc/transactions_bloc.dart'
    as _i20;
import 'package:expense_tracker/presentation/pages/wallets/add_wallet/bloc/add_wallet_bloc.dart'
    as _i28;
import 'package:expense_tracker/presentation/pages/wallets/bloc/wallets_bloc.dart'
    as _i24;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AppDatabase>(_i3.AppDatabase());
    gh.factory<_i4.BudgetDao>(() => _i4.BudgetDao(gh<_i3.AppDatabase>()));
    gh.factory<_i5.BudgetRepository>(
        () => _i6.BudgetRepositoryImpl(gh<_i4.BudgetDao>()));
    gh.factory<_i7.BudgetsBloc>(
        () => _i7.BudgetsBloc(gh<_i5.BudgetRepository>()));
    gh.factory<_i8.CategoryDao>(() => _i8.CategoryDao(gh<_i3.AppDatabase>()));
    gh.factory<_i9.CategoryRepository>(
        () => _i10.CategoryRepositoryImpl(gh<_i8.CategoryDao>()));
    gh.factoryParam<_i11.CreateCategoryBloc, _i12.Category?, dynamic>((
      category,
      _,
    ) =>
        _i11.CreateCategoryBloc(
          gh<_i9.CategoryRepository>(),
          category,
        ));
    gh.factory<_i13.MainBloc>(() => _i13.MainBloc());
    gh.factory<_i14.StatisticsDao>(
        () => _i14.StatisticsDao(gh<_i3.AppDatabase>()));
    gh.factory<_i15.StatisticsRepository>(
        () => _i16.StatisticsRepositoryImpl(gh<_i14.StatisticsDao>()));
    gh.factory<_i17.TransactionDao>(
        () => _i17.TransactionDao(gh<_i3.AppDatabase>()));
    gh.factory<_i18.TransactionRepository>(
        () => _i19.TransactionRepositoryImpl(gh<_i17.TransactionDao>()));
    gh.factory<_i20.TransactionsBloc>(
        () => _i20.TransactionsBloc(gh<_i18.TransactionRepository>()));
    gh.factory<_i21.WalletDao>(() => _i21.WalletDao(gh<_i3.AppDatabase>()));
    gh.factory<_i22.WalletRepository>(
        () => _i23.WalletRepositoryImpl(gh<_i21.WalletDao>()));
    gh.factory<_i24.WalletsBloc>(
        () => _i24.WalletsBloc(gh<_i22.WalletRepository>()));
    gh.factoryParam<_i25.AddBudgetBloc, _i26.Budget?, dynamic>((
      budget,
      _,
    ) =>
        _i25.AddBudgetBloc(
          gh<_i5.BudgetRepository>(),
          gh<_i22.WalletRepository>(),
          gh<_i9.CategoryRepository>(),
          budget,
        ));
    gh.factory<_i27.AddTransactionBloc>(() => _i27.AddTransactionBloc(
          gh<_i18.TransactionRepository>(),
          gh<_i22.WalletRepository>(),
          gh<_i9.CategoryRepository>(),
        ));
    gh.factoryParam<_i28.AddWalletBloc, _i29.Wallet?, dynamic>((
      wallet,
      _,
    ) =>
        _i28.AddWalletBloc(
          gh<_i22.WalletRepository>(),
          wallet,
        ));
    gh.factory<_i30.HomeBloc>(() => _i30.HomeBloc(
          gh<_i18.TransactionRepository>(),
          gh<_i22.WalletRepository>(),
        ));
    gh.factoryParam<_i31.StatisticsBloc, bool, dynamic>((
      isBarChart,
      _,
    ) =>
        _i31.StatisticsBloc(
          gh<_i15.StatisticsRepository>(),
          isBarChart,
        ));
    return this;
  }
}
