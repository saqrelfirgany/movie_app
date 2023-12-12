import 'dart:developer';

import 'package:bnoud/core/components/loading/main_loaing.dart';
import 'package:bnoud/core/utils/size_utils.dart';
import 'package:bnoud/features/home/home_screen/widgets/home_movie_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/theme_helper.dart';
import '../../../l10n/app_localizations.dart';
import 'home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final l10n = AppLocalizations.of(context);
    log('build Home');

    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          log('state ${state.submissionStatus}');

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'Movies'.toUpperCase(),
                style: theme.textTheme.headlineSmall!.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              centerTitle: true,
            ),
            body: state.isLoadingMovieList
                ? CenterMainLoading()
                : RefreshIndicator(
                    onRefresh: () => cubit.getHomeMovieList(),
                    child: HomeMovieList(cubit: cubit),
                  ),
          );
        },
      ),
    );
  }
}
