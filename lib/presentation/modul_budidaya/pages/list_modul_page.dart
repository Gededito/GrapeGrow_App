import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/data/models/responses/modul/modul_budidaya_response.dart';
import 'package:grapegrow_apps/presentation/modul_budidaya/bloc/get_modul_id/get_modul_by_id_bloc.dart';
import 'package:grapegrow_apps/presentation/modul_budidaya/widgets/card_detail_modul.dart';
import 'package:grapegrow_apps/presentation/modul_budidaya/widgets/list_modul_card.dart';

class ListModulPage extends StatefulWidget {
  final ModulBudidaya data;

  const ListModulPage({
    super.key,
    required this.data,
  });

  @override
  State<ListModulPage> createState() => _ListModulPageState();
}

class _ListModulPageState extends State<ListModulPage> {
  final String fontPoppins = 'FontPoppins';

  @override
  void initState() {
    super.initState();
    context.read<GetModulByIdBloc>().add(GetModulByIdEvent.getModulById(widget.data.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.data.name,
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardDetailModul(modulBudidaya: widget.data),
              const SizedBox(height: 8.0),
              Text(
                'Video Pembelajaran',
                style: TextStyle(
                  fontFamily: fontPoppins,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8.0),
              BlocBuilder<GetModulByIdBloc, GetModulByIdState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const Center(child: Text("Video Pada Modul Belum Tersedia")),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    success: (datas) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: datas.modulBudidaya.videos.length,
                            separatorBuilder: (context, index) => const SizedBox(height: 8.0),
                            itemBuilder: (context, index) => ListModulCard(data: datas.modulBudidaya.videos[index]),
                          ),
                        ),
                      );
                    }
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}