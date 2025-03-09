# Home Assistant Add-on: ACME.sh Certs using local CA

A Home Assistant add-on that uses ACME.sh to generate certificates using local CA.

ACME.sh uses in standalone mode to get register certificates and store them in `/ssl/`

## Troubleshooting
Certificates will be installed to `/ssl/`

# Support 
If you find this addon useful, please consider supporting my work by [buying me a coffee](https://www.buymeacoffee.com/kxynos)

### Buy me a coffee
<a href="https://www.buymeacoffee.com/kxynos" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: auto !important;width: auto !important;" ></a>


## Config
```
account: me@example.com
server: https://ca.local/acme/acme/directory
domains:
  - my.domain.tld
  - '*.my.domain.tld'
certfile: fullchain.pem
keyfile: privkey.pem
rootcertfile: root_ca.crt

```
## Automation 
Setup an automation to run 
```yaml
alias: Restart ACME.sh Addon
trigger:
  - platform: time
    at: "00:00"
action:
  - service: hassio.addon_restart
    data:
      addon: 5b07adba_acme_sh
initial_state: true
mode: single
description: Renew SSL Certificates using ZeroSSL
```
