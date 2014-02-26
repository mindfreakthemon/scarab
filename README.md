Scarab
======

FHE Library for encrypting/decrypting bits and performing add/mul (and/xor) over encrypted data.
Port of the existing [library](https://github.com/hcrypt-project/libScarab) by Henning Perl

Dependencies
======
* GMP: The GNU Multiple Precision Arithmetic Library — https://gmplib.org/ (or MPIR in GMP mode)
* MPIR: The GNU Multiple Precision Integers and Rationals — http://mpir.org/ (or GMP)
* MPFR: The GNU Multiple Precision Floating-Point Reliably — http://www.mpfr.org/ (required by FLINT)
* FLINT: Fast Library for Number Theory — http://flintlib.org/ (version *2.4.1*)

Building
======
The compilation is done using make.

```
$ make
```

Usage
=======
You can use the library as demonstrated in test.c. The following methods are exposed:

| function prototype | meaning |
| ------------------ | ------- |
| `fhe_keygen(fhe_pk_t pk, fhe_sk_t sk);` | Generate a keypair |
| `fhe_encrypt(mpz_t c, fhe_pk_t pk, int m);` | Encrypt a message (0 or 1) |
| `fhe_decrypt(mpz_t c, fhe_sk_t sk);` | Decrypt a cyphertext |
| `fhe_recrypt(mpz_t c, fhe_pk_t pk, fhe_sk_t sk);` | Recrypt a cyphertext (“refreshing” it) |
| `fhe_add(mpz_t res, mpz_t a, mpz_t b, fhe_pk_t pk);` | Add cyphertexts (= XOR) |
| `fhe_mul(mpz_t res, mpz_t a, mpz_t b, fhe_pk_t pk);` | Multiply cyphertexts (= AND) |
| `fhe_fulladd(mpz_t sum, mpz_t c_out, mpz_t a, mpz_t b, mpz_t c_in, fhe_pk_t pk);` | Add with carry in and carry out |
| `fhe_halfadd(mpz_t sum, mpz_t c_out, mpz_t a, mpz_t b, fhe_pk_t pk);` | Add with carry out |

References
=======
[1] C. Gentry, A fully homomorphic encryption scheme
[2] N. Smart and F. Vercauteren, Fully Homomorphic Encryption with Relatively Small Key and Ciphertext Sizes
[3] H. Perl, M. Brenner and M. Smith, POSTER: An Implementation of the Fully Homomorphic Smart-Vercauteren Crypto-System
