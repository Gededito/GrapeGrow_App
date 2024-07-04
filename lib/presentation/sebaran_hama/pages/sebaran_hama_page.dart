import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/bloc/all_sebaran_hama/all_sebaran_hama_bloc.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/pages/map_sebaran_hama.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/widget/card_sebaran_hama.dart';

class SebaranHamaPage extends StatefulWidget {

  const SebaranHamaPage({super.key});

  @override
  State<SebaranHamaPage> createState() => _SebaranHamaPageState();
}

class _SebaranHamaPageState extends State<SebaranHamaPage> {
  final String fontPoppins = 'FontPoppins';

  @override
  void initState() {
    super.initState();
    context.read<AllSebaranHamaBloc>().add(const AllSebaranHamaEvent.getAllSebaran());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sebaran Hama Anggur',
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
      body: BlocBuilder<AllSebaranHamaBloc, AllSebaranHamaState>(
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
                    itemCount: datas.sebaranHama.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 8.0),
                    itemBuilder: (context, index) {
                      return CardSebaranHama(data: datas.sebaranHama[index]);
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
          context.push(const MapSebaranHama());
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