import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/user_bloc/user_bloc.dart';
import '../../../widgets/my_icon_button.dart';
import '../../edit_profile_screen/edit_profile_screen.dart';
import 'user_profile_loading.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({
    super.key,
  });

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.status == UserStatus.loading) {
          return const UserProfileLoading();
        }
        return Container(
          padding: const EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              CircleAvatar(
                radius: 35.0,
                backgroundColor: Colors.grey,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(35.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://images.unsplash.com/flagged/photo-1559502867-c406bd78ff24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80',
                    errorWidget: (context, url, error) => AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        color: Colors.grey.shade200,
                        child: Image.asset(
                          "assets/images/no_image.png",
                        ),
                      ),
                    ),
                    width: 70.0,
                    height: 70.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.user?.fullName ?? '-',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      state.user?.username ?? '-',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              MyIconButton(
                icon: Icons.edit,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          EditProfileScreen(user: state.user!),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
