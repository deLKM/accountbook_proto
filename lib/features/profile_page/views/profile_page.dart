// Author: Ching-Yu

import 'package:accountbook_proto/common/widgets/proto_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/profile_header.dart';
import '../../login_page/views/login_page.dart';
import 'change_avatar_page.dart';
import '../providers/profile_page_provider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileProvider);
    final profileNotifier = ref.read(profileProvider.notifier);

    return Scaffold(
      appBar: ProtoAppBar(title: 'Profile'),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () async {
                        if (!profileState.isLoggedIn) {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()),
                          );
                          if (result == true) {
                            profileNotifier.updateLoginStatus(true);
                          }
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ChangeAvatarPage()),
                          );
                        }
                      },
                      child: ProfileHeader(
                        avatarUrl: '',
                        username: 'DefaultUser',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}