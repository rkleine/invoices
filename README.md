```shell
# create dirs
mkdir tmp log certs
# set copy env file and then set variables
cp rbenv-vars-example .rbenv-vars
# install gem
bundle install
# start server; to stop: [CTRL] + [C]
bundle exec rackup -s Puma
# enter to console with the app loaded
bundle exec pry -r ./app
# deploy to production
bundle exec cap production deploy
```

Certificates
------------

```shell
mkdir -p certs
openssl genrsa -out certs/privatekey.pem 1024
openssl req -newkey rsa:1024 -x509 -key certs/privatekey.pem -out certs/publickey.cer -days 365
openssl pkcs12 -export -out certs/public_privatekey.pfx -inkey certs/privatekey.pem -in certs/publickey.cer
```



References:
-----------

http://developer.xero.com/documentation/api/api-overview/

https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04

