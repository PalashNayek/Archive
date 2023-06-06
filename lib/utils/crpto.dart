import 'dart:async';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:hex/hex.dart';

import 'dart:convert';
import 'dart:typed_data';
import "package:pointycastle/export.dart";
import 'package:s2w/utils/app_constants.dart';


import 'dart:convert';
import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';


///Accepts encrypted data and decrypt it. Returns plain text
String decryptWithAES(String key, Encrypted encryptedData) {
  final cipherKey = Key.fromUtf8(key);
  final encryptService = Encrypter(AES(cipherKey, mode: AESMode.cbc)); //Using AES CBC encryption
  final initVector = IV.fromUtf8(key.substring(0, 16)); //Here the IV is generated from key. This is for example only. Use some other text or random data as IV for better security.

  return encryptService.decrypt(encryptedData, iv: initVector);
}

///Encrypts the given plainText using the key. Returns encrypted data
Encrypted encryptWithAES(String key, String plainText) {
  final cipherKey = Key.fromUtf8(key);
  final encryptService = Encrypter(AES(cipherKey, mode: AESMode.cbc));
  final initVector = IV.fromUtf8(key.substring(0, 16)); //Here the IV is generated from key. This is for example only. Use some other text or random data as IV for better security.

  Encrypted encryptedData = encryptService.encrypt(plainText, iv: initVector);
  return encryptedData;
}
/*Future<String> encryptJS(String text, String manager) async {
  final iv = randomBytes(AppConstants.ENCRYPTION_BYTE);
  final key = await scrypt(
    manager,
    AppConstants.ENCRYPTION_TYPE,
    AppConstants.ENCRYPTION_AGE,
  ) as Uint8List;
  print(key.toString());
  final cipher = Encrypter(AES(Key(key), mode: AESMode.cbc)).encrypt(text, iv: IV(iv));

  final encryptedText = cipher.bytes;
  return '${HEX.encode(iv)}:${HEX.encode(encryptedText)}';
}
Future<List<int>> scrypt(
    List<int> manager, List<int> encryptionType, int encryptionAge) async {
  final bcrypt = Bcrypt();
  final salt = String.fromCharCodes(encryptionType);
  final derivedKey = await bcrypt.hashPassword(manager, salt);

  return derivedKey.codeUnits;
}*/
/*Future<Uint8List> scrypt(String manager, String encryptionType, int encryptionAge) async {
  final salt = utf8.encode(encryptionType); // Use encryptionType as salt
  final scryptParameters = ScryptParameters(8,
     encryptionAge,
     64,
     32,
     salt as Uint8List,
  );

  final scrypt = Scrypt();
  final result = await scrypt.deriveKey(Utf8Encoder().convert(manager), scryptParameters,Utf8Encoder().convert(manager),scryptParameters);

  return Uint8List.fromList([result]);
}*/

Uint8List randomBytes(String length) {
  final random = Random.secure();
  final values = List<int>.generate(int.parse(length), (i) => random.nextInt(256));
  return Uint8List.fromList(values);
}
/*
// AES key size
const KEY_SIZE = 32; // 32 byte key for AES-256
const ITERATION_COUNT = 1000;

class AesHelper {
  static const CBC_MODE = 'CBC';
  static const CFB_MODE = 'CFB';

  static Uint8List deriveKey(dynamic password,
      {String salt = '',
        int iterationCount = ITERATION_COUNT,
        int derivedKeyLength = KEY_SIZE}) {
    if (password == null || password.isEmpty) {
      throw new ArgumentError('password must not be empty');
    }

    if (password is String) {
      password = createUint8ListFromString(password);
    }

    Uint8List saltBytes = createUint8ListFromString(salt);
    Pbkdf2Parameters params = Pbkdf2Parameters(saltBytes, iterationCount, derivedKeyLength);
    KeyDerivator keyDerivator = PBKDF2KeyDerivator(HMac(new SHA256Digest(), 64));
    keyDerivator.init(params);
    return keyDerivator.process(password);
  }

  static Uint8List pad(Uint8List src, int blockSize) {
    var pad = new PKCS7Padding();
    pad.init(null);

    int padLength = blockSize - (src.length % blockSize);
    var out = new Uint8List(src.length + padLength)..setAll(0, src);
    pad.addPadding(out, src.length);

    return out;
  }

  static Uint8List unpad(Uint8List src) {
    var pad = new PKCS7Padding();
    pad.init(null);

    int padLength = pad.padCount(src);
    int len = src.length - padLength;

    return new Uint8List(len)..setRange(0, len, src);
  }

  static String encrypt(String password, String plaintext, {String mode = CBC_MODE}) {
    Uint8List derivedKey = deriveKey(password);
    KeyParameter keyParam = new KeyParameter(derivedKey);
    BlockCipher aes = new AESFastEngine();

    var rnd = FortunaRandom();
    rnd.seed(keyParam);
    Uint8List iv = rnd.nextBytes(aes.blockSize);

    BlockCipher cipher;
    ParametersWithIV params = new ParametersWithIV(keyParam, iv);
    switch (mode) {
      case CBC_MODE:
        cipher = new CBCBlockCipher(aes);
        break;
      case CFB_MODE:
        cipher = new CFBBlockCipher(aes, aes.blockSize);
        break;
      default:
        throw new ArgumentError('incorrect value of the "mode" parameter');
        break;
    }
    cipher.init(true, params);

    Uint8List textBytes = createUint8ListFromString(plaintext);
    Uint8List paddedText = pad(textBytes, aes.blockSize);
    Uint8List cipherBytes = _processBlocks(cipher, paddedText);
    Uint8List cipherIvBytes = new Uint8List(cipherBytes.length + iv.length)
      ..setAll(0, iv)
      ..setAll(iv.length, cipherBytes);

    return base64.encode(cipherIvBytes);
  }

  static String decrypt(String password, String ciphertext,
      {String mode = CBC_MODE}) {
    Uint8List derivedKey = deriveKey(password);
    KeyParameter keyParam = new KeyParameter(derivedKey);
    BlockCipher aes = new AESFastEngine();

    Uint8List cipherIvBytes = base64.decode(ciphertext);
    Uint8List iv = new Uint8List(aes.blockSize)
      ..setRange(0, aes.blockSize, cipherIvBytes);

    BlockCipher cipher;
    ParametersWithIV params = new ParametersWithIV(keyParam, iv);
    switch (mode) {
      case CBC_MODE:
        cipher = new CBCBlockCipher(aes);
        break;
      case CFB_MODE:
        cipher = new CFBBlockCipher(aes, aes.blockSize);
        break;
      default:
        throw new ArgumentError('incorrect value of the "mode" parameter');
        break;
    }
    cipher.init(false, params);

    int cipherLen = cipherIvBytes.length - aes.blockSize;
    Uint8List cipherBytes = new Uint8List(cipherLen)
      ..setRange(0, cipherLen, cipherIvBytes, aes.blockSize);
    Uint8List paddedText = _processBlocks(cipher, cipherBytes);
    Uint8List textBytes = unpad(paddedText);

    return String.fromCharCodes(textBytes);
  }

  static Uint8List _processBlocks(BlockCipher cipher, Uint8List inp) {
    var out = new Uint8List(inp.lengthInBytes);

    for (var offset = 0; offset < inp.lengthInBytes;) {
      var len = cipher.processBlock(inp, offset, out, offset);
      offset += len;
    }

    return out;
  }
}*/
