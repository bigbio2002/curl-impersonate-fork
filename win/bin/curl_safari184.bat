:: The list of ciphers can be obtained by looking at the Client Hello message in
:: Wireshark, then converting it using this reference
:: https://wiki.mozilla.org/Security/Cipher_Suites
@echo off
"%~dp0curl.exe" ^
    --ciphers "TLS_AES_128_GCM_SHA256:TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256:TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384:TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256:TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256:TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384:TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256:TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256:TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA:TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA:TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA:TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA:TLS_RSA_WITH_AES_256_GCM_SHA384:TLS_RSA_WITH_AES_128_GCM_SHA256:TLS_RSA_WITH_AES_256_CBC_SHA:TLS_RSA_WITH_AES_128_CBC_SHA:TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA:TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA:TLS_RSA_WITH_3DES_EDE_CBC_SHA" ^
    --curves "X25519:P-256:P-384:P-521" ^
    --signature-hashes "ecdsa_secp256r1_sha256:rsa_pss_rsae_sha256:rsa_pkcs1_sha256:ecdsa_secp384r1_sha384:rsa_pss_rsae_sha384:rsa_pss_rsae_sha384:rsa_pkcs1_sha384:rsa_pss_rsae_sha512:rsa_pkcs1_sha512:rsa_pkcs1_sha1" ^
    -H "sec-fetch-dest: document" ^
    -H "user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Safari/605.1.15" ^
    -H "accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" ^
    -H "sec-fetch-site: none" ^
    -H "sec-fetch-mode: navigate" ^
    -H "accept-language: en-US,en;q=0.9" ^
    -H "priority: u=0, i" ^
    -H "accept-encoding: gzip, deflate, br" ^
    --http2 ^
    --http2-settings "2:0;3:100;4:2097152;9:1" ^
    --http2-pseudo-headers-order "msap" ^
    --http2-window-update 10420225 ^
    --http2-stream-weight 256 ^
    --http2-stream-exclusive 0 ^
    --compressed ^
    --tlsv1.0 --no-tls-session-ticket ^
    --cert-compression zlib ^
    --tls-grease ^
    --tls-signed-cert-timestamps ^
    %*
