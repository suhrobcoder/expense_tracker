// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:expense_tracker/data/database/app_database.dart' as _i3;
import 'package:expense_tracker/data/database/dao/wallet_dao.dart' as _i5;
import 'package:expense_tracker/data/database/models/wallets.dart' as _i10;
import 'package:expense_tracker/data/repository/wallet_repository_impl.dart'
    as _i7;
import 'package:expense_tracker/domain/repository/wallet_repository.dart'
    as _i6;
import 'package:expense_tracker/presentation/pages/main/bloc/main_bloc.dart'
    as _i4;
import 'package:expense_tracker/presentation/pages/wallets/add_wallet/bloc/add_wallet_bloc.dart'
    as _i9;
import 'package:expense_tracker/presentation/pages/wallets/bloc/wallets_bloc.dart'
    as _i8;
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
    gh.factory<_i4.MainBloc>(() => _i4.MainBloc());
    gh.factory<_i5.WalletDao>(() => _i5.WalletDao(gh<_i3.AppDatabase>()));
    gh.factory<_i6.WalletRepository>(
        () => _i7.WalletRepositoryImpl(gh<_i5.WalletDao>()));
    gh.factory<_i8.WalletsBloc>(
        () => _i8.WalletsBloc(gh<_i6.WalletRepository>()));
    gh.factoryParam<_i9.AddWalletBloc, _i10.Wallet?, dynamic>((
      wallet,
      _,
    ) =>
        _i9.AddWalletBloc(
          gh<_i6.WalletRepository>(),
          wallet,
        ));
    return this;
  }
}
