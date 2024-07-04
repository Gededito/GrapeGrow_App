import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/bloc/all_sebaran_varietas/all_sebaran_varietas_bloc.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/pages/map_sebaran_varietas.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/widget/card_sebaran_varietas.dart';

class SebaranVarietasPage extends StatefulWidget {
  const SebaranVarietasPage({super.key});

  @override
  State<SebaranVarietasPage> createState() => _SebaranVarietasPageState();
}

class _SebaranVarietasPageState extends State<SebaranVarietasPage> {
  final String fontPoppins = 'FontPoppins';

  @override
  void initState() {
    super.initState();
    context.read<AllSebaranVarietasBloc>().add(const AllSebaranVarietasEvent.getAllSebaran());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sebaran Varietas Anggur',
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
      body: BlocBuilder<AllSebaranVarietasBloc, AllSebaranVarietasState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Center(child: Text("Data Tidak Muncul")),
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
                    itemCount: datas.sebaranVarietas.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 8.0),
                    itemBuilder: (context, index) {
                      return CardSebaranVarietas(data: datas.sebaranVarietas[index]);
                    },
                  ),
                ),
              );
            }
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(const MapSebaranVarietas());
        },
        backgroundColor: AppColors.white,
        child: const Icon(
          Icons.location_on_outlined,
          size: 30,
          color: AppColors.primary,
        ),
      ),
    );
  }
}