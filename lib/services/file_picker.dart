import 'package:file_picker/file_picker.dart';
import 'package:flutter_application_66666/controller/file_picker_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

FilePickerController filePickerController = Get.put(FilePickerController());

Future filePicker() async {
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.image);
  filePickerController.fileMe.value = result!.files.first;
}
