Scarab
======

[![CircleCI](https://circleci.com/gh/mindfreakthemon/scarab.svg?style=svg&circle-token=25fb2f824128e9da50ae5d8ee333a4cad37d9392)](https://circleci.com/gh/mindfreakthemon/scarab)

FHE Library for encrypting/decrypting bits and performing add/mul (and/xor) over encrypted data.
Port/fork of the existing [library](https://github.com/hcrypt-project/libScarab) by Henning Perl.

Dependencies
======
* GMP: The GNU Multiple Precision Arithmetic Library — https://gmplib.org/ (or MPIR in GMP mode)
* MPIR: The GNU Multiple Precision Integers and Rationals — http://mpir.org/ (or GMP)
* MPFR: The GNU Multiple Precision Floating-Point Reliably — http://www.mpfr.org/ (required by FLINT)
* FLINT: Fast Library for Number Theory — http://flintlib.org/ (version 2.4.1+)

Building
======
The compilation is done using GYP and make.

```
$ gyp --depth=.
$ make
```

See Dockerfile for build instructions.

Debian-based
------
```apt-get -yy install libflint-2.5.2 libflint-dev libgmp-dev libmpfr-dev gcc g++ make automake autoconf gyp```.

RHEL-based
------
```yum install gcc gcc-c++ make automake autoconf mpfr-devel gmp-devel gyp```.

Note:
  * You will need `epel-release` to download `gyp`
  * Flint must be compiled from sources

Windows
-------

You can compile library under cygwin-x64 on Windows too. Just make sure you have installed all the following libs:
* gcc-core
* gcc-g++
* gmp
* mpfr
* autoconf2.1
* automake1.14
* libmprf4
* libmprf-devel
* libgmp10
* libgmpxx4
* libgmp-devel
* make

Usage
=======
You can use the library as demonstrated in test.c.

```
#include "scarab.h"
```

### Used types:

| type | usage |
| ---- | ----- |
| `fhe_pk_t pk;` | Private key |
| `fhe_sk_t sk;` | Shared key |
| `mpz_t c;` | Encrypted message container |

### Used functions:

| function prototype | meaning |
| ------------------ | ------- |
| `void fhe_pk_init(fhe_pk_t pk);` | Initialize private key |
| `void fhe_pk_clear(fhe_pk_t pk);` | Clear private key (destroy) |
| `void fhe_sk_init(fhe_sk_t sk);` | Initialize shared key |
| `void fhe_sk_clear(fhe_sk_t sk);` | Clear shared key (destroy) |
| `void fhe_keygen(fhe_pk_t pk, fhe_sk_t sk);` | Generate a keypair |
| `void fhe_encrypt(mpz_t c, fhe_pk_t pk, int m);` | Encrypt a message (0 or 1) |
| `int fhe_decrypt(mpz_t c, fhe_sk_t sk);` | Decrypt a cyphertext |
| `void fhe_recrypt(mpz_t c, fhe_pk_t pk, fhe_sk_t sk);` | Recrypt a cyphertext (“refreshing” it) |
| `void fhe_add(mpz_t res, mpz_t a, mpz_t b, fhe_pk_t pk);` | Add cyphertexts (= XOR) |
| `void fhe_mul(mpz_t res, mpz_t a, mpz_t b, fhe_pk_t pk);` | Multiply cyphertexts (= AND) |
| `void fhe_fulladd(mpz_t sum, mpz_t c_out, mpz_t a, mpz_t b, mpz_t c_in, fhe_pk_t pk);` | Add with carry in and carry out |
| `void fhe_halfadd(mpz_t sum, mpz_t c_out, mpz_t a, mpz_t b, fhe_pk_t pk);` | Add with carry out |

References
=======
1. C. Gentry, [A fully homomorphic encryption scheme](http://crypto.stanford.edu/craig/)
2. N. Smart and F. Vercauteren, [Fully Homomorphic Encryption with Relatively Small Key and Ciphertext Sizes](http://www.springerlink.com/content/c35831421t56537v/)
3. H. Perl, M. Brenner and M. Smith, [POSTER: An Implementation of the Fully Homomorphic Smart-Vercauteren Crypto-System](https://hcrypt.com/downloads/POSTER_Homomorphic_SV-Impl.pdf)
