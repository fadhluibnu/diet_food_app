import 'dart:convert';
import 'package:http/http.dart' as http;

class UserController{
  final String _url= 'http://email.ficode.my.id/api';

  login(data, endpoint) async{
    var apiUrl = _url+endpoint;
    return await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode(data),
      headers: _setHeadersNoToken(),
    );
  }

  register(data, endpoint) async{
    var apiUrl = _url+endpoint;
    return await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode(data),
      headers: _setHeadersNoToken(),
    );
  }

  logout(token, endpoint) async{
    var apiUrl = _url+endpoint;
    return await http.post(
      Uri.parse(apiUrl),
      headers: _setHeadersWithToken(token),
    );
  }

  getOtp(data, endpoint) async {
    var apiUrl = _url+endpoint;
    return await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode(data),
      headers: _setHeadersNoToken(),
    );
  }
  otpVerif(data, endpoint) async{
    var apiUrl = _url+endpoint;
    return await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode(data),
      headers: _setHeadersNoToken(),
    );
  }
  updatePassword(data, endpoint) async{
    var apiUrl = _url+endpoint;
    return await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode(data),
      headers: _setHeadersNoToken(),
    );
  }

  _setHeadersWithToken(token) =>{
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };

  _setHeadersNoToken() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
}