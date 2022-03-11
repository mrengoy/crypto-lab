# Notes

- TODO on meeting:
  - Have someone verify my message
  - Have richman receive my message
  - Send plaintextfile to mail

- What we need in the report:
  - 

- Question 1
  - Maybe because that will allow for faster communication in the future with a symmteric key
  - The message must be smaller than "n", so using asymmetric encryption directly, would probably be really impractical to implement, and unnecessary.
  
- Task 6
  - I sign 1kb and 1mb using `gpg --output message_.sig --clearsign message`
  - I export private and public keys to files using
    - `gpg --output public.pgp --armor --export username@email`
    - `gpg --output private.pgp --armor --export-secret-key username@email`

- Question 2 (file size of public/private key)
  - RSA
    - public: 973 bytes
    - private: 1918 bytes
  - DSA
    - public: 1412 bytes
    - private: 1528 bytes

- Question 3
  - Do they want us to clear sign here? (I assume not)
  - RSA:
    - 574 bytes for long and short
  - DSA
    - 277 bytes for long and short

- Question 4
  - (574 + 277) / 2 = 425.5 bytes
  - I assume they are asking about bytes, not time..

- Question 5
  - ... This one is long



