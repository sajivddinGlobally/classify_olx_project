import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

class Uploadproductimagecontroller {
  // static Future<Map<String, dynamic>> uploadProductImage({
  //   required String product_id,
  //   required File imageFile,
  // }) async {
  //   final Uri url = Uri.parse(
  //     'http://classified.globallywebsolutions.com/api/product/images',
  //   );
  //   var request = http.MultipartRequest("POST", url);
  //   request.headers.addAll({
  //     // Example Authorization header
  //     "Content-Type": "application/json",
  //     "Accept": "application/json", // Ensure content type is correct
  //     // You can add other custom headers here
  //   });
  //   request.files.add(
  //     await http.MultipartFile.fromPath("image", imageFile.path),
  //   );
  //   // Define gallaryImages as a list of file paths or objects
  //   List<File> gallaryImages = []; // Replace with actual list of images

  //   for (var file in gallaryImages) {
  //     request.files.add(
  //       await http.MultipartFile.fromPath(
  //         'service_gallery_images[]',
  //         file.path, // Use the correct file path
  //       ),
  //     );
  //   }
  //   request.fields.addAll({"product_id": "$product_id"});
  //   final http.StreamedResponse response = await request.send();

  //   final responseBody = await response.stream.bytesToString();
  //   log(responseBody);

  //   // if (response.statusCode == 200) {
  //   //   return jsonDecode(responseBody) as Map<String, dynamic>;

  //   // } else {
  //   //   throw Exception('Failed to upload product image: ${response.reasonPhrase}');
  //   // }

  //   Map<String, dynamic> data = jsonDecode(responseBody);
  //   if (response.statusCode == 200) {
  //     log(responseBody.toString());
  //   } else {
  //     throw Exception("Failed to register: ${response.reasonPhrase}");
  //   }
  //   return data;
  // }
  static Future<Map<String, dynamic>> uploadProductImages({
    required String productId,
    required List<File> images,
  }) async {
    final Uri url = Uri.parse(
      'http://classified.globallywebsolutions.com/api/product/images',
    );

    var request = http.MultipartRequest("POST", url);

    request.headers.addAll({"Accept": "application/json"});

    if (images.isNotEmpty) {
      request.files.add(
        await http.MultipartFile.fromPath("image", images.first.path),
      );

      for (int i = 1; i < images.length; i++) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'images[]', // ✅ Match the expected field name from API
            images[i].path,
          ),
        );
      }
    }

    request.fields["product_id"] = productId;

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    log(responseBody);

    final data = jsonDecode(responseBody);
    if (response.statusCode == 201 || response.statusCode == 200) {
      return data;
    } else {
      throw Exception("Failed to upload: ${response.reasonPhrase}, $data");
    }
  }
}
