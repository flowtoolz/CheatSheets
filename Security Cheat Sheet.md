# Security Cheat Sheet

## Goals

### Secrecy (Confidentiality)

* Methods: Encryption, Access Control / Authentication, Anonymization, [Steganography](https://en.wikipedia.org/wiki/Steganography)

### Integrity

* Methods: Signatures, Fingerprints / Checksums, Access Control / Authentication

### Availability

* Methods: Redundancies, Recovery mechanisms, Rate Limiting, Load Balancing

## Authentication

### Authentication: Basics

(for establishing a secure connection, signing content ...)

* [Symmetric Encryption](https://en.wikipedia.org/wiki/Symmetric-key_algorithm)
    * Goal and basis of secure connections: both ends share a secret (key) with which they encrypt and decrypt their communication
    * Problem: Establishing a shared secrete via a public medium. Solutions: 1) Diffie-Hellman key exchange or 2) Asymmetric Encryption (Public key cryptography)
* [Diffie-Hellman Algorithm](https://en.wikipedia.org/wiki/Diffie–Hellman_key_exchange)
    * Fundamental way two parties can establish a shared (symmetric) secret (key) even over a public medium
    * Problem: someone could intercept the establishing messages, pretending to each party to be the other, and then observe their whole interaction unencrypted. [This can be solved by asymmetric encryption plus a certificate](https://www.youtube.com/watch?v=vsXMMT2CqqE) (??).
* [Asymmetric Encryption](https://en.wikipedia.org/wiki/Public-key_cryptography) a.k.a. Public Key Cryptography
    * typical: server provides public key which acts more like a lock. client encrypts with public key. then only server can decrypt with its private key. public and private key complement each other and have to match. so server can at least proof it has the matching private key.
    * Problem: server could be a man in the middle making up its own key pair. so client has to verify that the server's public key is the correct one. This is solved by certificates and certificate authorities ... (?)
    * slow, primarily used to establish a shared private key that is then used to symmetrically encrypt the actual data
* [Certificate](https://en.wikipedia.org/wiki/Public_key_certificate)
    * reliably associates a public key with the identity of a person, system or institution
    * are signed by a certificate authority, the signature contains a hash of the whole certificate ensuring it refers to this exact specific certificate
    * when client receives a server's certificate, it typically performs these steps to verify it:
        1.	Extract the identity of the CA that issued the certificate from the certificate itself.
        2.	Look up the public key of the CA in the client's trusted store of CAs. This store contains the public keys of well-known CAs, which are included in browsers. (might involve checking intermediate certificates in the [chain of trust](https://en.wikipedia.org/wiki/Chain_of_trust) all the way up to a root certificate)
        3.	Use the CA's public key to verify the digital signature on the server's certificate. (has nothing to do with decrypting anything but is its own type of math magic)
        4.	If the verification is successful, the client can trust the server's certificate and establish a secure communication

* [CA](https://en.wikipedia.org/wiki/Certificate_authority) = Certificate Authority
    * 3rd party vouching for the authenticity of someone's certificate / public key 
* [Signing / Signature](https://en.wikipedia.org/wiki/Digital_signature)
    * what makes any certificate work is the signature it contains
    * based on asymmetric encryption
    * proofs the sender/server is who it claims to be (authenticity)
    * signed certificates are necessary to prevent man-in-the-middle attacks
* [Root Certificate](https://en.wikipedia.org/wiki/Root_certificate) a.k.a. Trust Anchor
    * preinstalled on the device / operating system
    * required for ultimate proof that someone is who he claims to be, see [Chain of trust](https://en.wikipedia.org/wiki/Chain_of_trust)
    * See [Computerphile: Secure Web Browsing (YouTube video)](https://www.youtube.com/watch?v=E_wX40fQwEA)
* [PKI](https://en.wikipedia.org/wiki/Public_key_infrastructure) = Public Key Infrastructure

### Authentication: Protocols

* [HTTPS](https://en.wikipedia.org/wiki/HTTPS) = HTTP Secure
    * HTTP encrypted via TLS
* [TLS](https://en.wikipedia.org/wiki/Transport_Layer_Security) = Transport Layer Security
    * most widely used protocol for secure client-server communication
    * sits on top of TCP and can be used for many things (HTTP, email ...)
    * relies on a certificate / signature
* [SSL](https://en.wikipedia.org/wiki/Transport_Layer_Security#SSL_1.0,_2.0,_and_3.0) = Secure Socket Layer
    * deprecated protocol, predecessor of TLS
* [Kerberos](https://en.wikipedia.org/wiki/Kerberos_(protocol))
    * rather complex protocol for mutual authentication (protects against man in the middle)
    * does not use public keys, only private keys
    * relies on existing trusted "key distribution center" to which network participants already have a secure connection
    * scalable selective access control through dedicated "ticket granting servers"
    * standard network authentication tool, in particular in LANs
    * central server might be a vulnarability in the sense that it knows the keys for all network connections and could be forced (by goverment, secret services etc.) to disclose the keys
* [DSA](https://en.wikipedia.org/wiki/Digital_Signature_Algorithm) = Digital Signature Algorithm
    * asymmetric encryption but only for signatures (?)

### Authentication: Access Codes

* [(Access-) Token](https://en.wikipedia.org/wiki/Access_token)
* [PAT](https://en.wikipedia.org/wiki/Personal_access_token) = Personal access token
* [JWT](https://en.wikipedia.org/wiki/JSON_Web_Token) = JSON Web Token
  * proposed standard, mostly used to authenticate web requests (?)
* [API Key](https://en.wikipedia.org/wiki/API_key)
* [Session ID](https://en.wikipedia.org/wiki/Session_ID)
* [Cookie](https://en.wikipedia.org/wiki/HTTP_cookie)
* [TOTP](https://en.wikipedia.org/wiki/Time-based_one-time_password)

### Authentication: Specific Topics

* [2FA](https://en.wikipedia.org/wiki/Multi-factor_authentication) = 2-Factor Authentication
    * Additional factor like a code via SMS or authenticator app
* [SSO](https://en.wikipedia.org/wiki/Single_sign-on) = Single Sign-On
    * Sign on once, then use multiple different connected services
* [OAuth](https://en.wikipedia.org/wiki/OAuth) = Open Authorization
    * "Standard" for authentication by delegation (leaves a lot open, many client specific implementations)
    * users can provide 3rd parties limited access to some server resource (like google account)
    * 3rd party gets an access token
    * different use cases or "OAuth flows"
    * rather [controversial](https://en.wikipedia.org/wiki/OAuth#Controversy), and not secure even in version 2.0
* [OpenID](https://en.wikipedia.org/wiki/OpenID)
    * open standard of a decentralized authentication protocol
    * OpenID Connect protocol: a more clearly specified variant of OAuth exclusively for authentication
* [OWASP](https://en.wikipedia.org/wiki/OWASP) = Open Web Application Security Project

## Hashing

* [SHA](https://en.wikipedia.org/wiki/Secure_Hash_Algorithms) = Secure Hash Algorithm
    * Widely used hash function
    * latest version SHA-3
    * SHA-1 still used by git since there it's only used stochastically, not to defend against attacks
* [MD5](https://en.wikipedia.org/wiki/MD5) = message-digest algorithm 5
    * old hash function, not secure enough for cryptographic applications, but fast

## Encryption

* [RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem)) = Rivest–Shamir–Adleman Algorithm
    * popular algorithm for asymmetric encryption
    * mostly just used to establish shared private key for symmetric enryption
* [AES](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard) = Advanced Encryption Standard
    * reasonably fast algorithm for encryption / decryption with a shared (symmetric) key
* [PGP](https://en.wikipedia.org/wiki/Pretty_Good_Privacy) = Pretty Good Privacy
    * Standardized encryption software
    * Relevance? Role? Relation to TLS, RSA and AES?

## Other

* [SSH](https://en.wikipedia.org/wiki/Secure_Shell) = Secure Shell
    * protocol for secure client-server interaction in unsecured network
    * Relation to TLS?? relation to shell?
* ~/.ssh folder
    * contains public and private keys for connecting to certain web servers (?)
* [OpenSSL](https://en.wikipedia.org/wiki/OpenSSL)
    * Open-source library with implementations of TLS and cryptographic algorithms
    * Has virtually nothing to do with SSL anymore
* [WAF](https://en.wikipedia.org/wiki/Web_application_firewall) = Web Application Firewall
* [ACL](https://en.wikipedia.org/wiki/Access-control_list) = Access Control List
* [AppSec](https://en.wikipedia.org/wiki/Application_security) = Application Security
    * And its branch [Mobile AppSec](https://en.wikipedia.org/wiki/Mobile_security)
