import 'dart:io';
import 'package:google_ml_kit/google_ml_kit.dart';



/// Declare the class
class EmotionDetector {

  /// initialize the variable that return output by default it is No face
  String? faceAtMoment = "No face";


  /// by using the GoogleMlKit first we initialize the FaceDetector class with some custom parameter
  /// enableClassification classify allow us to classify you image with different attribute such as face, eye
  /// minFaceSize required The smallest desired face size.
  /// Expressed as a proportion of the width of the head to the image width.
  /// Must be a value between 0.0 and 1.0
  final FaceDetector _faceDetector = GoogleMlKit.vision.faceDetector(

    FaceDetectorOptions(

      enableClassification: true,

      minFaceSize: 0.7,

    ),

  );

  /// detectEmotionFromImage take a image as a file and then convert in to Input image
  /// then pass it to FaceDetector
  /// FaceDetector is responsible for face appearance and as well as emotion

  Future<String?> detectEmotionFromImage({required File image}) async {
    /// converting file into ImageInput
    final inputImage = InputImage.fromFilePath(image.path);

    /// detect the face and it`s other parameters
    final List<Face> faces = await _faceDetector.processImage(inputImage);

    /// check weather there is a face or not
    if (faces.isEmpty) {
      return "Face Not found";
    }

    /// extract our image data from others parameters
    final Face face = faces.first;

    /// by using smilingProbability we can easily classify our image into
    /// four different mood ["Very Happy", "Happy","Neutral","Not Happy"]

    String? emotion = detectMood(smileProb:face.smilingProbability!);

    /// return the output
    return emotion;
  }

  /// detect the mood by using smilingProbability value
  String detectMood({required double smileProb}) {

    if (smileProb > 0.86) {

      return 'Very Happy';

    }
    else if (smileProb > 0.8) {

      return 'Happy';

    }

    else if (smileProb > 0.3) {

      return 'Neutral';

    }

    else {

      return 'Not Happy';

    }

  }

}
