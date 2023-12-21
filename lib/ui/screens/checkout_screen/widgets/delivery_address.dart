import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/user_bloc/user_bloc.dart';
import '../../../widgets/my_icon_button.dart';
import '../../address_screen/address_screen.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.user?.address == null) {
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 20.0,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text('Alamat Pengiriman'),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('-'),
                    MyIconButton(
                      icon: Icons.arrow_forward_ios,
                      iconSize: 15.0,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddressScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 20.0,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text('Alamat Pengiriman'),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${state.user!.address!.fullName} | ${state.user!.address!.phoneNumber}',
                          style: const TextStyle(
                            fontSize: 12.5,
                          ),
                        ),
                        Text(
                          '${state.user!.address!.otherDetails}, ${state.user!.address!.subdistrict}, ${state.user!.address!.regency}, ${state.user!.address!.province}, ${state.user!.address!.postalCode}',
                          style: const TextStyle(
                            fontSize: 12.5,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  MyIconButton(
                    icon: Icons.arrow_forward_ios,
                    iconSize: 15.0,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddressScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
