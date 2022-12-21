import 'package:logis02app/app/data/model/credential/credential.dart';
import 'package:logis02app/app/data/provider/credential_provider.dart';

class CredentialRepository {
  CredentialApi api = CredentialApi();

  Future<Credential> getUserByCred(
      {required String us, required String pa}) async {
    final raw = await api.getUserByCred(us: us, pa: pa);
    final body = raw.body;
    final credential = Credential.fromJson(body);
    return credential;
  }

  Future<void> testUploadFile(
      {required String token, required Map<String, dynamic> tempform}) async {
    await api.testUploadFile(token: token, tempform: tempform);
  }
}
