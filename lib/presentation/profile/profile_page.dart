import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/component/buttons.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/data/datasources/auth_local_datasource.dart';
import 'package:grapegrow_apps/data/models/responses/auth_response_model.dart';
import 'package:grapegrow_apps/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:grapegrow_apps/presentation/auth/pages/login_page.dart';
import 'package:grapegrow_apps/widgets/profile_widget.dart';

class ProfilePage extends StatelessWidget {
  final String fontPoppins = 'FontPoppins';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 16,
            fontFamily: fontPoppins,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                FutureBuilder<AuthResponseModel?>(
                  future: AuthLocalDatasource().getAuthData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Text(
                            snapshot.data!.user.name,
                            style: TextStyle(
                              fontFamily: fontPoppins,
                              fontSize: 20,
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            snapshot.data!.user.email,
                            style: TextStyle(
                              fontFamily: fontPoppins,
                              fontSize: 14,
                              color: AppColors.grey,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  }
                ),
                const SizedBox(height: 12.0),
                const Divider(),
                const SizedBox(height: 12.0),
                ProfileWidget(
                  icon: Icons.language,
                  title: 'Ubah Bahasa',
                  onPressed: () {},
                ),
                ProfileWidget(
                  icon: Icons.info_outline,
                  title: 'Tentang Aplikasi',
                  onPressed: () {},
                ),
                const SizedBox(height: 20.0),
                Button.filled(
                  onPressed: () {
                    context.read<LogoutBloc>().add(const LogoutEvent.logout());
                    AuthLocalDatasource().removeAuthData();
                    context.pushReplacement(const LoginPage());
                  },
                  label: 'Keluar',
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}