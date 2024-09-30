import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:weather/weather.dart';

class CardCuaca extends StatefulWidget {

  const CardCuaca({
    super.key,
  });

  @override
  State<CardCuaca> createState() => _CardCuacaState();
}

class _CardCuacaState extends State<CardCuaca> {
  final String fontPoppins = 'FontPoppins';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff005644),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.14),
            blurRadius: 16,
            offset: const Offset(2, 4),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on_rounded,
                    color: AppColors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    'Tangerang',
                    style: TextStyle(
                      fontFamily: fontPoppins,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Senin, 20 Mei 2024",
                    style: TextStyle(
                      fontFamily: fontPoppins,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "32°C",
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: fontPoppins,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    "Cerah",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white,
                      fontFamily: fontPoppins,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 4.0),
              Image.asset(
                "assets/cuaca/hujan.png",
                width: 80,
                height: 80,
              ),
              const SizedBox(width: 4.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.water_drop_outlined,
                        size: 16,
                        color: AppColors.white,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        "12",
                        style: TextStyle(
                          color: AppColors.white,
                          fontFamily: fontPoppins,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      const Icon(
                        Icons.wind_power,
                        size: 16,
                        color: AppColors.white,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        "20",
                        style: TextStyle(
                          color: AppColors.white,
                          fontFamily: fontPoppins,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    // return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
    //   builder: (context, state) {
    //
    //     return state.maybeWhen(
    //       orElse: () => const Center(child: Text("Cuaca Tidak Muncul")),
    //       loading: () => const Center(child: CircularProgressIndicator()),
    //       success: (data) {
    //         print(data.toString());
    //
    //         return Container(
    //           padding: const EdgeInsets.symmetric(
    //             horizontal: 12.0,
    //             vertical: 8.0,
    //           ),
    //           decoration: BoxDecoration(
    //             color: const Color(0xff005644),
    //             borderRadius: BorderRadius.circular(12.0),
    //             boxShadow: [
    //               BoxShadow(
    //                 color: AppColors.black.withOpacity(0.14),
    //                 blurRadius: 16,
    //                 offset: const Offset(2, 4),
    //                 spreadRadius: 2,
    //               ),
    //             ],
    //           ),
    //           child: Column(
    //             children: [
    //               Column(
    //                 children: [
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       const Icon(
    //                         Icons.location_on_outlined,
    //                         color: AppColors.white,
    //                         size: 20,
    //                       ),
    //                       const SizedBox(
    //                         width: 4.0,
    //                       ),
    //                       Text(
    //                         "Tangerang Selatan",
    //                         style: TextStyle(
    //                           fontFamily: fontPoppins,
    //                           fontSize: 16,
    //                           fontWeight: FontWeight.w500,
    //                           color: AppColors.white,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   const SizedBox(
    //                     height: 4.0,
    //                   ),
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Text(
    //                         "Senin, 20 Mei 2024",
    //                         style: TextStyle(
    //                           fontFamily: fontPoppins,
    //                           fontSize: 14,
    //                           fontWeight: FontWeight.w300,
    //                           color: AppColors.white,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //               const SizedBox(height: 40),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                 children: [
    //                   Column(
    //                     children: [
    //                       Text(
    //                         "${data.temp}°C",
    //                         style: TextStyle(
    //                           fontSize: 26,
    //                           fontFamily: fontPoppins,
    //                           fontWeight: FontWeight.w600,
    //                           color: AppColors.white,
    //                         ),
    //                       ),
    //                       Text(
    //                         widget.data.condition,
    //                         style: TextStyle(
    //                           fontFamily: fontPoppins,
    //                           color: AppColors.white,
    //                           fontWeight: FontWeight.w300,
    //                           fontSize: 14,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   const SizedBox(width: 4.0),
    //                   Image.asset(
    //                     "assets/cuaca/hujan.png",
    //                     width: 80,
    //                     height: 80,
    //                   ),
    //                   const SizedBox(width: 4.0),
    //                   Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Row(
    //                         children: [
    //                           const Icon(
    //                             Icons.water_drop_outlined,
    //                             size: 16,
    //                             color: AppColors.white,
    //                           ),
    //                           const SizedBox(width: 4.0),
    //                           Text(
    //                             data.humidity.toString(),
    //                             style: TextStyle(
    //                               color: AppColors.white,
    //                               fontFamily: fontPoppins,
    //                               fontSize: 14,
    //                               fontWeight: FontWeight.w500,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       const SizedBox(height: 4.0),
    //                       Row(
    //                         children: [
    //                           const Icon(
    //                             Icons.wind_power,
    //                             size: 16,
    //                             color: AppColors.white,
    //                           ),
    //                           const SizedBox(width: 4.0),
    //                           Text(
    //                             data.windSpeed.toString(),
    //                             style: TextStyle(
    //                               color: AppColors.white,
    //                               fontFamily: fontPoppins,
    //                               fontSize: 14,
    //                               fontWeight: FontWeight.w500,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         );
    //       }
    //     );
    //   },
    // );
  }
}
