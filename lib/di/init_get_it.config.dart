// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:expense_tracker/data/database/app_database.dart' as _i3;
import 'package:expense_tracker/data/database/dao/category_dao.dart' as _i4;
import 'package:expense_tracker/data/database/dao/transaction_dao.dart' as _i9;
import 'package:expense_tracker/data/database/dao/wallet_dao.dart' as _i13;
import 'package:expense_tracker/data/database/models/wallets.dart' as _i19;
import 'package:expense_tracker/data/repository/category_repository_impl.dart'
    as _i6;
import 'package:expense_tracker/data/repository/transaction_repository_impl.dart'
    as _i11;
import 'package:expense_tracker/data/repository/wallet_repository_impl.dart'
    as _i15;
import 'package:expense_tracker/domain/repository/category_repository.dart'
    as _i5;
import 'package:expense_tracker/domain/repository/transaction_repository.dart'
    as _i10;
import 'package:expense_tracker/domain/repository/wallet_repository.dart'
    as _i14;
import 'package:expense_tracker/presentation/pages/add_transaction/bloc/add_transaction_bloc.dart'
    as _i17;
import 'package:expense_tracker/presentation/pages/create_category/bloc/create_category_bloc.dart'
    as _i7;
import 'package:expense_tracker/presentation/pages/main/bloc/main_bloc.dart'
    as _i8;
import 'package:expense_tracker/presentation/pages/transactions/bloc/transactions_bloc.dart'
    as _i12;
import 'package:expense_tracker/presentation/pages/wallets/add_wallet/bloc/add_wallet_bloc.dart'
    as _i18;
import 'package:expense_tracker/presentation/pages/wallets/bloc/wallets_bloc.dart'
    as _i16;
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
    gh.factory<_i4.CategoryDao>(() => _i4.CategoryDao(gh<_i3.AppDatabase>()));
    gh.factory<_i5.CategoryRepository>(
        () => _i6.CategoryRepositoryImpl(gh<_i4.CategoryDao>()));
    gh.factoryParam<_i7.CreateCategoryBloc, dynamic, dynamic>((
      category,
      _,
    ) =>
        _i7.CreateCategoryBloc(
          gh<_i5.CategoryRepository>(),
          category,
        ));
    gh.factory<_i8.MainBloc>(() => _i8.MainBloc());
    gh.factory<_i9.TransactionDao>(
        () => _i9.TransactionDao(gh<_i3.AppDatabase>()));
    gh.factory<_i10.TransactionRepository>(
        () => _i11.TransactionRepositoryImpl(gh<_i9.TransactionDao>()));
    gh.factory<_i12.TransactionsBloc>(
        () => _i12.TransactionsBloc(gh<_i10.TransactionRepository>()));
    gh.factory<_i13.WalletDao>(() => _i13.WalletDao(gh<_i3.AppDatabase>()));
    gh.factory<_i14.WalletRepository>(
        () => _i15.WalletRepositoryImpl(gh<_i13.WalletDao>()));
    gh.factory<_i16.WalletsBloc>(
        () => _i16.WalletsBloc(gh<_i14.WalletRepository>()));
    gh.factory<_i17.AddTransactionBloc>(() => _i17.AddTransactionBloc(
          gh<_i10.TransactionRepository>(),
          gh<_i14.WalletRepository>(),
          gh<_i5.CategoryRepository>(),
        ));
    gh.factoryParam<_i18.AddWalletBloc, _i19.Wallet?, dynamic>((
      wallet,
      _,
    ) =>
        _i18.AddWalletBloc(
          gh<_i14.WalletRepository>(),
          wallet,
        ));
    return this;
  }
}
