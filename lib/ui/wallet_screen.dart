import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_app_dashboard/custom_widget/app_button.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height/12),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: const Color(0xFF07264D).withOpacity(0.9),
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
                        CardButton('Transfer',SvgPicture.asset(
                          'assets/images/money_send.svg',
                        )),
                        CardButton('Deposit',SvgPicture.asset(
                          'assets/images/money_recive.svg',
                        )),
                        CardButton('swap',SvgPicture.asset(
                          'assets/images/bitcoin_convert.svg',
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text('Transaction History',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 38,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/credit_logo.svg',
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  const Text('Janet Doe',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  const Spacer(),
                                  const Text('\$4,500.00',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  Text('BTC BNB',
                                      style: TextStyle(color: Colors.grey)),
                                  Spacer(),
                                  Text('0.0000056 BTC',
                                      style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: 4),
            ),
          )
        ],
      ),
    );
  }
}
