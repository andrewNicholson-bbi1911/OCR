import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesseract/Common/indev_style.dart';
import 'package:tesseract/Core/FileManagment/file_managment.dart';
import 'package:tesseract/Core/ImageExtention/image_ext_cut.dart';
import 'package:tesseract/Feature/Domain/UseCases/recognize_image.dart';
import 'package:tesseract/Feature/Presentation/Recognition_cubit/recognition_cubit.dart';
import 'package:tesseract/Feature/Presentation/Widgets/picture_selection_and_recognition/picture_selector_frame_widget.dart';
import 'package:tesseract/Core/ForWidgets/picture_selector_class.dart';

import '../../../main.dart';

///
/// NOTE: после обновы плагина камеры до версии 0.9.4+12, пришлось поменять
/// работу с контроллером камеры и убрать его из dispose, тк он выдаёт ошибку
/// при компилляции
///



class ImageSelectionSelectorPage extends StatefulWidget{

  ImageSelectionSelectorPage({Key? key}) : super(key: key);

  @override
  State<ImageSelectionSelectorPage> createState() => _ImageSelectionSelectorPageState();
}

class _ImageSelectionSelectorPageState extends State<ImageSelectionSelectorPage>{
  late CameraController _camController;
  late PictureSelector _picSelector;
  late File _recognizingImg;

  var _imgCut = false;

  @override
  void initState() {
    super.initState();
    _camController = CameraController(cameras.first, ResolutionPreset.max, imageFormatGroup: ImageFormatGroup.bgra8888);
    _picSelector = PictureSelector();
    _camController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    print("inited");
  }

  @override
  void dispose() {
    //_camController.dispose(); пришлось убрать тк выдаёт ошибку.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (!_camController.value.isInitialized) {
      print("camera controller is not initialized");
      return Container();
    }

    var childrenWidgets = [
      CameraPreview(_camController),
      Positioned.fill( child: PictureSelectorWidget(_picSelector)),];
    if(_imgCut){
      childrenWidgets.add(Container(
        child: Image.file(_recognizingImg)
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select fragment"),
        centerTitle: true,
      ),
      body: Center(
        child:
            Stack(
              children: childrenWidgets
            )
        ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child :FloatingActionButton(
          onPressed:()
          {
            _imgCut = false;

            _cutFrameSegment(_camController, _picSelector)
                .then((file) =>
                //setState(() => {_recognizingImg = file, _imgCut = true}));
            BlocProvider.of<RecognitionCubit>(context).recognizeSelectedImage(RecognizeImageParams(file.path)));
          },
          child: const Icon(
            Icons.document_scanner_outlined,
            size: 35,
            color: AppInDevStyle.floatButtonBGSandBlueColor,
          ),
          backgroundColor: AppInDevStyle.floatButtonIconWhiteColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // This trailing comma makes auto-formatting nicer for build methods.,
    );
  }
  
  Future<File> _cutFrameSegment(CameraController camController, PictureSelector picSelector) async
  {
    final pic = await camController.takePicture();
    final picImg = imageFromSync(pic);
    final cutImg = cutImage(picImg, picSelector.getPicturedLeftTopPoint(), picSelector.getPicturedRightBotPoint());
    final res = await saveImage(makeUniqueName("cutImageSegment"), cutImg);
    return res;
    //final res = rotateAndCutImage(picImg, picSelector.getPicturedLeftTopPoint(), picSelector.getPicturedRightBotPoint());
    //return res;

  }

}