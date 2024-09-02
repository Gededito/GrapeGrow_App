import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/presentation/hama/bloc/hama/hama_bloc.dart';
import 'package:grapegrow_apps/presentation/hama/widgets/hama_card.dart';

class HamaPage extends StatefulWidget {
  const HamaPage({super.key});

  @override
  State<HamaPage> createState() => _HamaPageState();
}

class _HamaPageState extends State<HamaPage> {
  final String fontPoppins = 'FontPoppins';

  @override
  void initState() {
    super.initState();
    context.read<HamaBloc>().add(const HamaEvent.getAllHama());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hama Dan Penyakit',
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
      body: BlocBuilder<HamaBloc, HamaState>(
        builder: (context, state) {
          return state.maybeWhen(
              orElse: () => const Center(child: Text("Tidak Muncul Datanya")),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              success: (datas) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: datas.penyakitAnggur.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 8.0),
                      itemBuilder: (context, index) => HamaCard(data: datas.penyakitAnggur[index]),
                    ),
                  ),
                );
              }
          );
        },
      ),
    );
  }
}