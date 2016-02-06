//automatic proxy configuration
function FindProxyForURL(url, host){
  if (dnsDomainIs(host, ".sohu.com")|| dnsDomainIs(host, ".xiami.com")) 
  return "PROXY 183.207.228.60:80; PROXY 120.197.234.164:80; PROXY 106.39.79.67:80; PROXY 183.60.156.17:8888";

  return "DIRECT";
}