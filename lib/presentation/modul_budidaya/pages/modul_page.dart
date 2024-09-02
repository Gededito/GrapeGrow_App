import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/presentation/modul_budidaya/bloc/get_all_modul/get_all_modul_bloc.dart';
import 'package:grapegrow_apps/presentation/modul_budidaya/widgets/modul_card.dart';

class ModulPage extends StatefulWidget {
  const ModulPage({super.key});

  @override
  State<ModulPage> createState() => _ModulPageState();
}

class _ModulPageState extends State<ModulPage> {
  final String fontPoppins = 'FontPoppins';

  @override
  void initState() {
    super.initState();
    context.read<GetAllModulBloc>().add(const GetAllModulEvent.getAllModul());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kumpulan Modul Budidaya",
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
      body: BlocBuilder<GetAllModulBloc, GetAllModulState>(
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
                    itemCount: datas.modulBudidaya.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 8.0),
                    itemBuilder: (context, index) => ModulCard(data: datas.modulBudidaya[index]),
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