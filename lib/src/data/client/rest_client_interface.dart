abstract class IRestClient {
  Future getData({required String url});
  Future postData({required String url, required Map<String, dynamic> data});
  Future deleteData({required String url});
}
