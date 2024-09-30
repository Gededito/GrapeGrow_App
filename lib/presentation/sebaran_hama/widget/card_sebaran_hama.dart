import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/data/datasources/auth_local_datasource.dart';
import 'package:grapegrow_apps/data/models/responses/sebaran/add_sebaran_hama_response.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/bloc/delete_sebaran_hama/delete_sebaran_hama_bloc.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/pages/detail_sebaran_hama.dart';
import 'package:grapegrow_apps/core/constants/constant.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/pages/sebaran_hama_page.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/pages/update_sebaran_hama.dart';

class CardSebaranHama extends StatefulWidget {
  final SebaranHama data;

  const CardSebaranHama({
    super.key,
    required this.data,
  });

  @override
  State<CardSebaranHama> createState() => _CardSebaranHamaState();
}

class _CardSebaranHamaState extends State<CardSebaranHama> {
  final String fontPoppins = 'FontPoppins';
  int? userId;
  String alamat = "";

  @override
  void initState() {
    super.initState();
    _getAddress();
    _checkUserId();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteSebaranHamaBloc, DeleteSebaranHamaState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          success: (message) {
            SnackBar(
              content: Text(
                message,
                style: const TextStyle(
                  color: AppColors.white,
                ),
              ),
            );
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  message,
                  style: const TextStyle(
                    color: AppColors.white,
                  ),
                ),
              )
            );
          },
        );
      },
      builder: (context, state) => state.maybeWhen(
          orElse: () => GestureDetector(
            onTap: () => context.push(DetailSebaranHama(data: widget.data)),
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.14),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: '${Variables.baseUrl}/storage/${widget.data.gambar}',
                        placeholder: (context, url) => const SizedBox(
                          width: 80,
                          height: 80,
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        errorWidget: (context, url, error) {
                          return const Icon(Icons.error);
                        },
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.data.nama,
                            style: TextStyle(
                              fontFamily: fontPoppins,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            widget.data.user!.name,
                            style: TextStyle(
                              fontFamily: fontPoppins,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            alamat,
                            style: TextStyle(
                              fontFamily: fontPoppins,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          if (userId == widget.data.userId)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 20,
                                    color: AppColors.secondary,
                                  ),
                                  onPressed: () {
                                    context.pushReplacement(
                                      UpdateHamaSebaran(data: widget.data),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 20,
                                    color: Colors.redAccent,
                                  ),
                                  onPressed: _deleteData,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }

  Future<void> _getAddress() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(widget.data.lat, widget.data.lon);
      Placemark place = placemarks[0];
      setState(() {
        alamat = "${place.street}, ${place.subLocality},"
            "${place.locality}, ${place.country}";
      });
    } catch (e) {
      alamat = "Tidak Menampilkan Alamat";
    }
  }

  Future<void> _checkUserId() async {
    final authData = await AuthLocalDatasource().getAuthData();

    setState(() {
      userId = authData!.user.id;
    });
  }

  void _deleteData() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi Hapus"),
          content: const Text("Apakah anda yakin ingin menghapus data ini?"),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                context
                    .read<DeleteSebaranHamaBloc>()
                    .add(DeleteSebaranHamaEvent.deleteSebaranHama(widget.data.id));
                context.pushReplacement(const SebaranHamaPage());
              },
              child: const Text("Hapus"),
            ),
          ],
        );
      }
    );
  }
}