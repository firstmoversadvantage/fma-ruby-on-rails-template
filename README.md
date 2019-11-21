### hCaptcha

The hCaptcha gem does not respond to traffic coming from `localhost`, as per the "Local Development" section in https://docs.hcaptcha.com

On a Mac, you'll need to add the following to your `/etc/private/hosts` (`/etc/hosts` on Ubuntu):

```
127.0.0.1       localhost.fmadata.com
127.0.0.1       test.fmadata.com
```
