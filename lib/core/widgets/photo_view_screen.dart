import 'package:bnoud/core/components/loading/main_loaing.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../repositories/home_repo.dart';
import '../dependencies/dependencies.dart';

class PhotoViewScreen extends StatelessWidget {
  PhotoViewScreen({
    super.key,
  });

  final HomeRepository homeRepository = serviceLocator<HomeRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo View'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      extendBody: true,
      body: PhotoView(
        loadingBuilder: (context, event) => CenterMainLoading(),
        imageProvider: NetworkImage(
          homeRepository.photoViewUrl,
        ),
      ),
    );
  }
}
