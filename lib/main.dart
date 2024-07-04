import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/data/datasources/auth_local_datasource.dart';
import 'package:grapegrow_apps/data/datasources/forum_remote_datasource.dart';
import 'package:grapegrow_apps/data/datasources/hama_remote_datasource.dart';
import 'package:grapegrow_apps/data/datasources/map_remote_datasource.dart';
import 'package:grapegrow_apps/data/datasources/sebaran_hama_route_datasource.dart';
import 'package:grapegrow_apps/data/datasources/sebaran_varietas_route_datasource.dart';
import 'package:grapegrow_apps/data/datasources/varietas_remote_datasource.dart';
import 'package:grapegrow_apps/data/models/responses/auth_response_model.dart';
import 'package:grapegrow_apps/presentation/auth/bloc/login/login_bloc.dart';
import 'package:grapegrow_apps/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:grapegrow_apps/presentation/auth/bloc/register/register_bloc.dart';
import 'package:grapegrow_apps/presentation/auth/pages/login_page.dart';
import 'package:grapegrow_apps/presentation/forum/bloc/get_comment_forum_id/get_comment_forum_id_bloc.dart';
import 'package:grapegrow_apps/presentation/forum/bloc/list_post/list_post_bloc.dart';
import 'package:grapegrow_apps/presentation/forum/bloc/post/post_bloc.dart';
import 'package:grapegrow_apps/presentation/forum/pages/forum_page.dart';
import 'package:grapegrow_apps/presentation/hama/bloc/hama/hama_bloc.dart';
import 'package:grapegrow_apps/presentation/home/home_page.dart';
import 'package:grapegrow_apps/presentation/profile/profile_page.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/bloc/add_map_hama/add_map_hama_bloc.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/bloc/add_sebaran_hama/add_sebaran_hama_bloc.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/bloc/all_sebaran_hama/all_sebaran_hama_bloc.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/bloc/add_map_varietas/add_map_varietas_bloc.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/bloc/add_sebaran_varietas/add_sebaran_varietas_bloc.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/bloc/all_sebaran_varietas/all_sebaran_varietas_bloc.dart';
import 'package:grapegrow_apps/presentation/varietas/bloc/varietas/varietas_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBlocProviders(
      child: MaterialApp( 
        title: 'GrapeGrow Apps',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white),
          useMaterial3: true, // Menggunakan Material Design 3
        ),
        debugShowCheckedModeBanner: false,
        home: FutureBuilder<AuthResponseModel>( // Membangun tampilan awal berdasarkan status otentikasi
          future: AuthLocalDatasource().getAuthData(), // Mendapatkan data otentikasi dari sumber lokal
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return const DashboardPage();
            } else {
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }

  // Fungsi untuk membuat beberapa BlocProvider
  Widget _buildBlocProviders({required Widget child}) {
    return MultiBlocProvider(
      providers: [
        // Membuat berbagai BlocProvider untuk manajemen state aplikasi
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => LogoutBloc()),
        BlocProvider(create: (context) => VarietasBloc(VarietasRemoteDatasource())),
        BlocProvider(create: (context) => HamaBloc(HamaRemoteDatasource())),
        BlocProvider(create: (context) => ListPostBloc(ForumRemoteDatasource())),
        BlocProvider(create: (context) => PostBloc(ForumRemoteDatasource())),
        BlocProvider(create: (context) => GetCommentForumIdBloc(ForumRemoteDatasource())),
        BlocProvider(create: (context) => AllSebaranHamaBloc(SebaranHamaRouteDatasource())),
        BlocProvider(create: (context) => AddSebaranHamaBloc(SebaranHamaRouteDatasource())),
        BlocProvider(create: (context) => AddMapHamaBloc(MapRemoteDataSource())),
        BlocProvider(create: (context) => AllSebaranVarietasBloc(SebaranVarietasRouteDatasource())),
        BlocProvider(create: (context) => AddMapVarietasBloc(MapRemoteDataSource())),
        BlocProvider(create: (context) => AddSebaranVarietasBloc(SebaranVarietasRouteDatasource()))
      ],
      child: child,
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  int _selectedIndex = 0;

  final List<Widget> _page = [
    const HomePage(),
    const ForumPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Beranda'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Forum Diskusi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil'
          ),
        ],
      ),
    );
  }
}