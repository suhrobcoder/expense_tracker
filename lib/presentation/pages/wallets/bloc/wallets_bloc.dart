import 'package:expense_tracker/data/database/models/wallets.dart';
import 'package:expense_tracker/domain/repository/wallet_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'wallets_event.dart';
part 'wallets_state.dart';

@injectable
class WalletsBloc extends Bloc<WalletsEvent, WalletsState> {
  final WalletRepository repository;

  WalletsBloc(this.repository) : super(WalletsState.initial()) {
    on<_WalletsChanged>((event, emit) {
      emit(state.copyWith(wallets: event.wallets));
    });
    listenForWallets();
  }

  void listenForWallets() {
    repository.watch().listen((event) {
      add(_WalletsChanged(event));
    });
  }
}

class _WalletsChanged extends WalletsEvent {
  final List<Wallet> wallets;

  _WalletsChanged(this.wallets);
}
