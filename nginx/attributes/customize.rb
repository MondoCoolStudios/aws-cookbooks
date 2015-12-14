###
# This is the place to override the nginx cookbook's default attributes.
#
# Do not edit THIS file directly. Instead, create
# "nginx/attributes/customize.rb" in your cookbook repository and
# put the overrides in YOUR customize.rb file.
###

# The following shows how to disable NGinx compression:
#
#normal[:nginx][:gzip] = 'off'
#normal[:nginx][:gzip_static] = 'off'

# --------------------------------------

# SSL

# The following allows ssl to be enforced by all connections by
# redirecting all trafic coming to port 80 to port 443
normal[:nginx][:force_ssl] = true

# Prefer server ciphers (Prefer RC4 first to combat BEAST) 
normal[:nginx][:ssl_prefer_server_ciphers] = on

# The following allows specification of the ssl_protocols
# The default ssl_protocols will be used if not set.
# See: http://nginx.org/en/docs/http/configuring_https_servers.html
#normal[:nginx][:ssl_protocols] = 'TLSv1 TLSv1.1 TLSv1.2'
# arrays are also supported
normal[:nginx][:ssl_protocols] = ['TLSv1', 'TLSv1.1', 'TLSv1.2']

# Limit ciphers allowed
normal[:nginx][:ssl_ciphers] = ['EECDH+AESGCM', 'EDH+AESGCM', 'AES256+EECDH', 'AES256+EDH', '!aNULL', '!eNULL', '!EXPORT', '!DES', '!RC4', '!3DES', '!MD5', '!PSK', '!ADH', '!EDH', '!CAMELLIA', '!LOW', '!MEDIUM', '!EXP']

# Enable a shared cache, since it is defined at this level 	
# it will be used for all virtual hosts. 1m = 4000 active sessions, 	
normal[:nginx][:ssl_session_cache] = ['shared', 'SSL', '50m']

# The SSL default cache timeout
normal[:nginx][:ssl_session_timeout] = '5m'

# generate with openssl dhparam -out /etc/nginx/ssl/dhparam.pem 4096
# ssl_dhparam /etc/nginx/ssl/dhparam.pem; 
normal[:nginx][:ssl_dhparam] = true

