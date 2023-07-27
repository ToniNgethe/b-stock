import 'package:bstock/app/di/injector.dart';
import 'package:bstock/core/internet_status/presentation/bloc/internet_status_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetStatusWidget extends StatelessWidget {
  const InternetStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<InternetStatusCubit>()..getCurrentStatus(),
      child: BlocBuilder<InternetStatusCubit, ConnectivityStatus>(
        builder: (ctx, state) {
          if (state == ConnectivityStatus.none) {
            return const SizedBox();
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  state == ConnectivityStatus.connected
                      ? Icons.network_wifi
                      : Icons.signal_wifi_connected_no_internet_4,
                  color: state == ConnectivityStatus.connected
                      ? Colors.green
                      : Colors.grey,
                  size: 14,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  state == ConnectivityStatus.connected ? 'Online' : 'Offline',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: state == ConnectivityStatus.connected
                          ? Colors.green
                          : Colors.grey),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
