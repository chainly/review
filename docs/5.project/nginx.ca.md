# ca

> ca to ngnix on centos7

## lets-encrypt

> https://certbot.eff.org/lets-encrypt/centosrhel7-nginx  
> https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-centos-7

```
# yum-repo
yum install epel-release

# certbot
# *conda deactivate maybe needed*
# *epel repo maybe disabled
yum --enablerepo "epel" install certbot python2-certbot-nginx

# ca
# Q&A, **skip to get ca, if something wrong, this may help you**
# ImportError: No module named 'requests.packages.urllib3'
# https://github.com/certbot/certbot/issues/5104#issuecomment-404706042
# it solve my, but get `Cannot uninstall 'requests'. It is a distutils installed project and
# thus we cannot accurately determine which files belong to it which would lead to only a partial uninstall.`
# so change step like this:
#yum remove python-requests -y
#pip uninstall urllib3 -y
#yum remove python-urllib3 -y
#yum --enablerepo "epel" install certbot python2-certbot-nginx

# get ca
certbot --nginx -d qianli.cc -d "www.qianli.cc" -d "opqian.com" -d "vpn.opqian.com"

# Q&A
# Client with the currently selected authenticator does not support any combination of challenges that will satisfy the CA.
# You may need to use an authenticator plugin that can do challenges over DNS.
# A: need to change plugin or something else, @TODO
```
