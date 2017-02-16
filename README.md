# travis-encrypt-cli
Command-line Unix script to [encrypt sensitive information][doc] in
[<img src="https://cdn.travis-ci.com/images/logos/TravisCI-Mascot-1-20feeadb48fc2492ba741d89cb5a5c8a.png" width=32 /> Travis CI][travis]
.travis.yml files.

## Dependencies
There is no need to have Ruby and [Travis CLI][CLI] installed. With this script
you only need:

- [curl] to download RSA public key from Travis repo API
- [OpenSSL] with RSA support to encrypt text
- [Bash] to run script

## Usage
```
echo -n 'your_api_key' | ./encrypt_for_travis.bash user/repo
echo -n 'variable=value' | ./encrypt_for_travis.bash user/repo
```

You **must** use `echo -n` to not add newline character at the end of the encoded
string. For the same reason you **cannot** use [here strings] like:
<pre><del><<<'variable=value' ./encrypt_for_travis.bash user/repo</del></pre>

If you need proxy to access Travis website you should define HTTPS_PROXY
[environment variable for curl][proxy] globally or per request:
```
echo -n 'variable=value' | HTTPS_PROXY='10.0.1.7:8080' ./encrypt_for_travis.bash user/repo
```

## Alternatives
* [Travis CLI][CLI] official tool
* [Online] tool using JavaScript
* third-party [tools]

[CLI]: https://github.com/travis-ci/travis.rb
[doc]: https://docs.travis-ci.com/user/encryption-keys/
[travis]: https://docs.travis-ci.com/
[Bash]: https://www.gnu.org/software/bash/bash.html
[curl]: https://curl.haxx.se/
[OpenSSL]: https://www.openssl.org/
[here strings]: https://www.gnu.org/software/bash/manual/html_node/Redirections.html#Here-Strings
[proxy]: https://curl.haxx.se/docs/manpage.html#ENVIRONMENT
[Online]: http://rkh.github.io/travis-encrypt/public/
[tools]: https://docs.travis-ci.com/user/apps/
