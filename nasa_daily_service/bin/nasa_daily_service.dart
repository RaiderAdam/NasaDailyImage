import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const String _listenAddress = '0.0.0.0';
const int _listenPort = 8080;
const String _apiKeyNasa = 'zqyFkVM11tKhHUt1StPmVCNlk80JczlxBSgiflT3';

void main() async {
  // Initialize the web server
  var handler = const shelf.Pipeline()
      .addMiddleware(shelf.logRequests())
      .addHandler(_echoRequest);
  var server = await io.serve(handler, _listenAddress, _listenPort);
  print('Serving at http://${server.address.host}:${server.port}');
}

// Handle http requests for nasa image date
Future<shelf.Response> _echoRequest(shelf.Request request) async {
  return shelf.Response.ok(await getImageUrlByDate('${request.url}'));
}

// Get the image url based on date
Future<String> getImageUrlByDate(String strImageDate) async {
  return callNasaApi(strImageDate);
}

Future<String> callNasaApi(strImageDate) async {
  var url = Uri.https('api.nasa.gov', '/planetary/apod',
      {'api_key': _apiKeyNasa, 'date': strImageDate});
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var hdurl = jsonResponse['hdurl'];
    print('hdurl: $hdurl.');
    return hdurl;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return '${response.statusCode}';
  }
}
