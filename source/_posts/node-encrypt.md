---
title: node-encrypt
date: 2020-04-04 19:00:05
tags:
    - node
    - 加密
categories:
    - node
---

1、对称加密

加密、解密所用的秘钥是相同的，即encryptKey === decryptKey。

常见的对称加密算法：DES、3DES、AES、Blowfish、RC5、IDEA。

加、解密伪代码：

encryptedText = encrypt(plainText, key); // 加密 plainText = decrypt(encryptedText, key); // 解密

2、非对称加密

又称公开秘钥加密。加密、解密所用的秘钥是不同的，即encryptKey !== decryptKey。

加密秘钥公开，称为公钥。解密秘钥保密，称为秘钥。

常见的非对称加密算法：RSA、DSA、ElGamal。

加、解密伪代码：

encryptedText = encrypt(plainText, publicKey); // 加密 plainText = decrypt(encryptedText, priviteKey); // 解密

3、对比与应用

除了秘钥的差异，还有运算速度上的差异。通常来说：

对称加密速度要快于非对称加密。
非对称加密通常用于加密短文本，对称加密通常用于加密长文本。


```
//盐值
const _key='sadfslekrtuew5iutoselgdtjiypoydse4ufhs.edtyo;s8te4arfeliawkfhtsie5tlfia;sefdshroiupeoutwyeli5gurse;ihf';

//MD5加密
function md5(str){
  let obj=crypto.createHash('md5');

  obj.update(str);

  return obj.digest('hex');
}

//MD5盐值加密
function md5_2(str){
  return md5(md5(str)+_key);
}


```


参考
https://www.cnblogs.com/eret9616/p/9197968.html
https://www.cnblogs.com/eret9616/p/9197927.html