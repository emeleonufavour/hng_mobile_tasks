import 'dart:convert';

import 'package:cryptography/cryptography.dart';
import 'package:hex/hex.dart';

/// [EncryptionHelper] is a helper class that performs encryption on data using
/// Advanced Encryption Standard (AES) algorithm with 256 bits.

class EncryptionHelper {
  /// [getPasswordBytes] converts the [password] from its String value to a series of bytes.
  /// [maxBytes] signifies the maximum amount of bytes we use for this function. The default amount
  /// is 32 bytes. If the generated bytes from the password is less, we add an 8-digit number or cut
  /// to accomodate our given number of bytes.
  static List<int> getPasswordBytes(String password, {int maxBytes = 32}) {
    final pBytes = utf8.encode(password).toList();
    final passwordLength = pBytes.length;
    if (maxBytes > passwordLength) {
      for (int i = 0; i < (maxBytes - passwordLength); i++) {
        pBytes.add(64326913);
      }
    } else if (passwordLength > maxBytes) {
      pBytes.sublist(0, maxBytes);
    }
    return pBytes;
  }

  /// [encryptData] is the main encryption function.
  /// [password] is the password which will be used for decryption.
  /// [data] is the message in a series of bytes.
  static Future<String> encryptData(String password, List<int> data) async {
    List<int> passwordInBytes = getPasswordBytes(password);

    // Set algorithm used for encryption
    // ** NOTE: DO NOT CHANGE!!! **
    /// A change will cause incompatibility with [DecryptionHelper]
    AesGcm algorithm = AesGcm.with256bits();

    /// [nonce] - A generated random number that we add
    /// to the encrypted message to make it harder to decrypt.
    List<int> nonce = algorithm.newNonce();

    // A secret key used in the encryption process
    SecretKey secretKey =
        await algorithm.newSecretKeyFromBytes(passwordInBytes);

    /// [secretBox] houses the data, [secretKey] and [nonce]
    SecretBox secretBox =
        await algorithm.encrypt(data, secretKey: secretKey, nonce: nonce);

    final cipherText = secretBox.cipherText;
    // Message authentication code (MAC) calculated during encryption process,
    // respresented in bytes.
    final List<int> mac = secretBox.mac.bytes;

    // HEX code representations of [cipherText], [nonce] and [mac]
    final String hexCodedCipher = HEX.encode(cipherText);
    final String hexCodedNonce = HEX.encode(nonce);
    final String hexCodedMac = HEX.encode(mac);

    String encryptedText = '$hexCodedNonce%$hexCodedCipher%$hexCodedMac';
    return encryptedText;
  }

  /// [getEncryptedMessage] is a helper function to encrypt a [message] provided
  /// the [password] in String format. It returns the [encryptedData] as a Future of type `String`
  static Future<String> getEncryptedMessage(
      String message, String password) async {
    List<int> messageToBytes = utf8.encode(message);
    final encryptedData = await encryptData(password, messageToBytes);

    return encryptedData;
  }
}
