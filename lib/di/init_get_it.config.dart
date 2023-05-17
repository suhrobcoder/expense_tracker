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
import 'package:expense_tracker/data/database/dao/category_dao.dart' as _i7;
import 'package:expense_tracker/data/database/dao/transaction_dao.dart' as _i12;
import 'package:expense_tracker/data/database/dao/wallet_dao.dart' as _i16;
import 'package:expense_tracker/data/database/models/budgets.dart' as _i21;
import 'package:expense_tracker/data/database/models/wallets.dart' as _i24;
import 'package:expense_tracker/data/repository/budget_repository_impl.dart'
    as _i6;
import 'package:expense_tracker/data/repository/category_repository_impl.dart'
    as _i9;
import 'package:expense_tracker/data/repository/transaction_repository_impl.dart'
    as _i14;
import 'package:expense_tracker/data/repository/wallet_repository_impl.dart'
    as _i18;
import 'package:expense_tracker/domain/repository/budget_repository.dart'
    as _i5;
import 'package:expense_tracker/domain/repository/category_repository.dart'
    as _i8;
import 'package:expense_tracker/domain/repository/transaction_repository.dart'
    as _i13;
import 'package:expense_tracker/domain/repository/wallet_repository.dart'
    as _i17;
import 'package:expense_tracker/presentation/pages/add_transaction/bloc/add_transaction_bloc.dart'
    as _i22;
import 'package:expense_tracker/presentation/pages/budgets/add_budget/bloc/add_budget_bloc.dart'
    as _i20;
import 'package:expense_tracker/presentation/pages/create_category/bloc/create_category_bloc.dart'
    as _i10;
import 'package:expense_tracker/presentation/pages/home/bloc/home_bloc.dart'
    as _i25;
import 'package:expense_tracker/presentation/pages/main/bloc/main_bloc.dart'
    as _i11;
import 'package:expense_tracker/presentation/pages/transactions/bloc/transactions_bloc.dart'
    as _i15;
import 'package:expense_tracker/presentation/pages/wallets/add_wallet/bloc/add_wallet_bloc.dart'
    as _i23;
import 'package:expense_tracker/presentation/pages/wallets/bloc/wallets_bloc.dart'
    as _i19;
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
    gh.factory<_i7.CategoryDao>(() => _i7.CategoryDao(gh<_i3.AppDatabase>()));
    gh.factory<_i8.CategoryRepository>(
        () => _i9.CategoryRepositoryImpl(gh<_i7.CategoryDao>()));
    gh.factoryParam<_i10.CreateCategoryBloc, dynamic, dynamic>((
      category,
      _,
    ) =>
        _i10.CreateCategoryBloc(
          gh<_i8.CategoryRepository>(),
          category,
        ));
    gh.factory<_i11.MainBloc>(() => _i11.MainBloc());
    gh.factory<_i12.TransactionDao>(
        () => _i12.TransactionDao(gh<_i3.AppDatabase>()));
    gh.factory<_i13.TransactionRepository>(
        () => _i14.TransactionRepositoryImpl(gh<_i12.TransactionDao>()));
    gh.factory<_i15.TransactionsBloc>(
        () => _i15.TransactionsBloc(gh<_i13.TransactionRepository>()));
    gh.factory<_i16.WalletDao>(() => _i16.WalletDao(gh<_i3.AppDatabase>()));
    gh.factory<_i17.WalletRepository>(
        () => _i18.WalletRepositoryImpl(gh<_i16.WalletDao>()));
    gh.factory<_i19.WalletsBloc>(
        () => _i19.WalletsBloc(gh<_i17.WalletRepository>()));
    gh.factoryParam<_i20.AddBudgetBloc, _i21.Budget?, dynamic>((
      budget,
      _,
    ) =>
        _i20.AddBudgetBloc(
          gh<_i5.BudgetRepository>(),
          gh<_i17.WalletRepository>(),
          gh<_i8.CategoryRepository>(),
          budget,
        ));
    gh.factory<_i22.AddTransactionBloc>(() => _i22.AddTransactionBloc(
          gh<_i13.TransactionRepository>(),
          gh<_i17.WalletRepository>(),
          gh<_i8.CategoryRepository>(),
        ));
    gh.factoryParam<_i23.AddWalletBloc, _i24.Wallet?, dynamic>((
      wallet,
      _,
    ) =>
        _i23.AddWalletBloc(
          gh<_i17.WalletRepository>(),
          wallet,
        ));
    gh.factory<_i25.HomeBloc>(() => _i25.HomeBloc(
          gh<_i13.TransactionRepository>(),
          gh<_i17.WalletRepository>(),
        ));
    return this;
  }
}
