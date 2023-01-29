# Authentik - Bare Metal Install
This is a repository of install scripts for [Authentik](https://goauthentik.io) ([Github](https://github.com/goauthentik/authentik)) to allow for it to be installed on any ordinary bare metal host or LXC container.

The scope of this repository is specifically the Debian 11 LXC template distribution that is shipped with Proxmox Virtual Environment.

## Notes
 - This does **not** install, nor configure Postgres or Redis. Once they're set up, set the configuration values in `/etc/authentik/config.yml`.
 - This currently does not support updating, and will install the `main` branch without a tag.
 - Python is **installed from source**, as the packages for 3.11 are missing from the Debian repositories shipped with the scoped LXC template.
 - **This setup is fully unsupported, and has no fallbacks if any step fails.**