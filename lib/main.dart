import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FilePicDemo());
  }
}

class FilePicDemo extends StatefulWidget {
  const FilePicDemo({super.key});

  @override
  State<FilePicDemo> createState() => _FilePicDemoState();
}

class _FilePicDemoState extends State<FilePicDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              // final result = await FilePicker.platform.pickFiles();
              final result2 = await FilePicker.platform.pickFiles(allowMultiple: true);
              // if (result == null) result;

              if (result2 == null) result2;
              openFiles(result2!.files);
              // open_file(result2.files);
              //
              // Single File pic
              // final file  = result!.files.first;
              // log('NAme : ${file.name}');
              // log('Bytes : ${file.bytes}');
              // log('Name : ${file.size}');
              // log('Extation :${file.extension}');
              // log('Path :${file.path}');
                // openFile(file);
                // final newFile =  saveFilePermanetly(file);
            },
            child: Text('File Pic')),
      ),
    );
  }



  openFile(PlatformFile file){
    OpenFile.open(file.path);
  }

  void openFiles(List<PlatformFile>files)=>
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
      FilesPage(files:files,onOpendFile:openFile)));

  Future<File>saveFilePermanetly(PlatformFile file)async{
    final appStorage  = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }
}

class FilesPage extends StatefulWidget {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpendFile;

  const FilesPage({super.key, required this.files, required this.onOpendFile});

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Files'),),
      body: Center(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              crossAxisCount: 2,
            ),
            itemCount: widget.files.length,
            itemBuilder: (context,index){
              final file  = widget.files[index];
              return buildFile(file);
            },
        ),
      ),
    );
  }

  Widget buildFile(PlatformFile file) {
    final kb = file.size/1024;
    final mb = kb/1024;
    final fileSize = mb>=1 ?'${mb.toStringAsFixed(2)}MB':'${kb.toStringAsFixed(2)}KB';
    final extension = file.extension??'none';
    final color = getColor(extension);


    return InkWell(
      onTap: ()=>widget.onOpendFile(file),
      child: Container(
        color: Colors.cyan,
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),

              ),
              child: Text('.$extension',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),),
            )),
            SizedBox(height: 8,),
            Text(file.name,style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis,),
            Text(fileSize,style: TextStyle(fontSize: 16),overflow: TextOverflow.ellipsis,),

          ],
        ),
      ),
    );
  }

  getColor(String extension) {}
}



