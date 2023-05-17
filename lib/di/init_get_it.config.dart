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
import 'package:expense_tracker/data/database/dao/category_dao.dart' as _i6;
import 'package:expense_tracker/data/database/dao/transaction_dao.dart' as _i11;
import 'package:expense_tracker/data/database/dao/wallet_dao.dart' as _i15;
import 'package:expense_tracker/data/database/models/wallets.dart' as _i21;
import 'package:expense_tracker/data/repository/budget_repository_impl.dart'
    as _i5;
import 'package:expense_tracker/data/repository/category_repository_impl.dart'
    as _i8;
import 'package:expense_tracker/data/repository/transaction_repository_impl.dart'
    as _i13;
import 'package:expense_tracker/data/repository/wallet_repository_impl.dart'
    as _i17;
import 'package:expense_tracker/domain/repository/category_repository.dart'
    as _i7;
import 'package:expense_tracker/domain/repository/transaction_repository.dart'
    as _i12;
import 'package:expense_tracker/domain/repository/wallet_repository.dart'
    as _i16;
import 'package:expense_tracker/presentation/pages/add_transaction/bloc/add_transaction_bloc.dart'
    as _i19;
import 'package:expense_tracker/presentation/pages/create_category/bloc/create_category_bloc.dart'
    as _i9;
import 'package:expense_tracker/presentation/pages/home/bloc/home_bloc.dart'
    as _i22;
import 'package:expense_tracker/presentation/pages/main/bloc/main_bloc.dart'
    as _i10;
import 'package:expense_tracker/presentation/pages/transactions/bloc/transactions_bloc.dart'
    as _i14;
import 'package:expense_tracker/presentation/pages/wallets/add_wallet/bloc/add_wallet_bloc.dart'
    as _i20;
import 'package:expense_tracker/presentation/pages/wallets/bloc/wallets_bloc.dart'
    as _i18;
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
    gh.factory<_i5.BudgetRepositoryImpl>(
        () => _i5.BudgetRepositoryImpl(gh<_i4.BudgetDao>()));
    gh.factory<_i6.CategoryDao>(() => _i6.CategoryDao(gh<_i3.AppDatabase>()));
    gh.factory<_i7.CategoryRepository>(
        () => _i8.CategoryRepositoryImpl(gh<_i6.CategoryDao>()));
    gh.factoryParam<_i9.CreateCategoryBloc, dynamic, dynamic>((
      category,
      _,
    ) =>
        _i9.CreateCategoryBloc(
          gh<_i7.CategoryRepository>(),
          category,
        ));
    gh.factory<_i10.MainBloc>(() => _i10.MainBloc());
    gh.factory<_i11.TransactionDao>(
        () => _i11.TransactionDao(gh<_i3.AppDatabase>()));
    gh.factory<_i12.TransactionRepository>(
        () => _i13.TransactionRepositoryImpl(gh<_i11.TransactionDao>()));
    gh.factory<_i14.TransactionsBloc>(
        () => _i14.TransactionsBloc(gh<_i12.TransactionRepository>()));
    gh.factory<_i15.WalletDao>(() => _i15.WalletDao(gh<_i3.AppDatabase>()));
    gh.factory<_i16.WalletRepository>(
        () => _i17.WalletRepositoryImpl(gh<_i15.WalletDao>()));
    gh.factory<_i18.WalletsBloc>(
        () => _i18.WalletsBloc(gh<_i16.WalletRepository>()));
    gh.factory<_i19.AddTransactionBloc>(() => _i19.AddTransactionBloc(
          gh<_i12.TransactionRepository>(),
          gh<_i16.WalletRepository>(),
          gh<_i7.CategoryRepository>(),
        ));
    gh.factoryParam<_i20.AddWalletBloc, _i21.Wallet?, dynamic>((
      wallet,
      _,
    ) =>
        _i20.AddWalletBloc(
          gh<_i16.WalletRepository>(),
          wallet,
        ));
    gh.factory<_i22.HomeBloc>(() => _i22.HomeBloc(
          gh<_i12.TransactionRepository>(),
          gh<_i16.WalletRepository>(),
        ));
    return this;
  }
}
