// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'wallets_bloc.dart';

class WalletsState extends Equatable {
  const WalletsState({
    required this.wallets,
    required this.totalBalance,
  });

  final List<Wallet> wallets;
  final double totalBalance;

  factory WalletsState.initial() {
    return const WalletsState(
      wallets: [],
      totalBalance: 0.0,
    );
  }

  WalletsState copyWith({
    List<Wallet>? wallets,
    double? totalBalance,
  }) {
    return WalletsState(
      wallets: wallets ?? this.wallets,
      totalBalance: totalBalance ?? this.totalBalance,
    );
  }

  @override
  List<Object> get props => [wallets];
}
