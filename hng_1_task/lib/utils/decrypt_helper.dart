import 'dart:convert';

import 'package:cryptography/cryptography.dart';
import 'package:hex/hex.dart';
import 'package:hng_1_task/utils/utils.dart';

/// [DecryptionHelper] is a helper class that performs decryption on data using
/// Advanced Encryption Standard (AES) algorithm with 256 bits.

class DecryptionHelper {
  /// [decryptData] performs decryption on a provided encrypted text.
  /// [encryptedData] is the encrypted text and
  /// [password] is the password used to aid in the decryption process
  static Future<List<int>> decryptData(
      String encryptedData, String password) async {
    // Generate the password in series of bytes.
    List<int> pBytes = EncryptionHelper.getPasswordBytes(password);

    // Split data into the respective nonce, cipher and mac
    List<String> splittedData = encryptedData.split('%');

    // Cancel operation if exactly 3 pieces of information are not provided
    if (splittedData.length != 3) {
      throw Exception('Invalid cipher text size');
    }
    String nonce = splittedData[0];
    String cipherText = splittedData[1];
    String mac = splittedData[2];

    // Decode the HEX representation of each
    List<int> decodedHexNonce = HEX.decode(nonce);
    List<int> decodedHexText = HEX.decode(cipherText);
    List<int> decodedHexMac = HEX.decode(mac);

    // Select algorithm used in the decryption process.
    // ** NOTE: DO NOT CHANGE!!! **
    // A change in selct algorithm will cause incompatibility with [EncryptionHelper]
    AesGcm algorithm = AesGcm.with256bits();

    // Generate secret box from decoded hex nonce, hex cipher text and hex mac
    SecretBox secretBox = SecretBox(decodedHexText,
        nonce: decodedHexNonce, mac: Mac(decodedHexMac));

    // Generated secret key
    SecretKey secretKey = await algorithm.newSecretKeyFromBytes(pBytes);

    // Decrypted data in series of bytes
    List<int> decryptedData =
        await algorithm.decrypt(secretBox, secretKey: secretKey);
    return decryptedData;
  }

  /// [getDecryptedMessage] is the main decryption function. It receives
  /// [encryptedData] which is the data to encrypt and the required
  /// [password] used in encrypting the data
  static Future<String> getDecryptedMessage(
      String encryptedData, String password) async {
    final List<int> decrypt = await decryptData(encryptedData, password);
    final String decodedMessage = utf8.decode(decrypt);

    return decodedMessage;
  }
}
