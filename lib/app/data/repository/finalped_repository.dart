import 'package:logis02app/app/data/model/subest/subest.dart';
import 'package:logis02app/app/data/provider/finalped_provider.dart';

class FinalPedRepository {
  FinalPedApi api = FinalPedApi();

  Future<SubEst> getSubEstsFromState(
      {required String token, required String keyreason}) async {
    // print(keyreason);
    // print(token);
    final raw =
        await api.getSubEstsFromState(token: token, keyreason: keyreason);
    final body = raw.body;
    // print(raw.body);
    final substates = SubEst.fromJson(body);
    return substates;
  }

  Future<void> insertCommentAndMotiv(
      {required String token,
      required String id,
      required String comment,
      required String idmotiv,
      required String keyreason}) async {
    Map<String, dynamic> rawbody = {
      "id": id,
      "comment": comment,
      "keyReason": keyreason,
      "reason": idmotiv
    };
    final raw = await api.insertCommentAndMotiv(token: token, rawbody: rawbody);
    final body = raw.body;
  }
}
