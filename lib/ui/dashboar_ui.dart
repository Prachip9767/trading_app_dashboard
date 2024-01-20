import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_app_dashboard/custom_widget/app_button.dart';
import 'package:trading_app_dashboard/utils/bloc.dart';

import '../utils/bloc_state.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double cardWidth =
        MediaQuery.of(context).size.width / 2 - 16; // Adjust the width here
    return Scaffold(
      body: BlocBuilder<MyBloc, MyState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DataLoaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 12),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        color: const Color(0xFF177DFF).withOpacity(0.9),
                      ), // elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Text('My Wallet',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Spacer(),
                                USDButton()
                              ],
                            ),
                            const SizedBox(height: 17),
                            const Text('\$8,540.00',
                                style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                            const SizedBox(height: 29),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CardButton(
                                    'Transfer',
                                    SvgPicture.asset(
                                      'assets/images/money_send.svg',
                                    )),
                                CardButton(
                                    'Deposit',
                                    SvgPicture.asset(
                                      'assets/images/money_recive.svg',
                                    )),
                                CardButton(
                                    'swap',
                                    SvgPicture.asset(
                                      'assets/images/bitcoin_convert.svg',
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //
                  // Recommended cryptocurrencies
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('Recommended',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  Center(
                    child: SizedBox(
                      height: 179,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                          vertical: 24,
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 12),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.recommended
                            .length, // Replace with your data length
                        itemBuilder: (context, index) {
                          final crypto = state.recommended[index];
                          return Card(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            child: Container(
                              width: cardWidth,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/bitcoin_logo.svg',
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Text(crypto.name),
                                        const Spacer(),
                                        const Icon(
                                          Icons.show_chart,
                                          color: Colors.green,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 33,
                                    ),
                                    Row(
                                      children: [
                                        Text('+ ${crypto.change}',
                                            style: const TextStyle(
                                                color: Colors.green)),
                                        const Spacer(),
                                        Text('${crypto.amount.toString()}'),
                                      ],
                                    ) // Replace with your crypto icon
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // Your assets
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('My Assets',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    // height: 179,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 12,
                        ),
                        shrinkWrap: true,
                        itemCount: state
                            .myAssets.length, // Replace with your data length
                        itemBuilder: (context, index) {
                          final asset = state.myAssets[index];
                          return Card(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            child: SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/theher_logo.svg',
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Text(asset.name),
                                        const Spacer(),
                                        Text('\$${asset.amount.toString()}'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.show_chart,
                                            color: Colors.redAccent),
                                        Text(
                                          '${asset.change}%',
                                          style: const TextStyle(
                                              color: Colors.redAccent),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          '\$${12.5}%',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const Spacer(),
                                        const Text('0.0000056 BTC',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
