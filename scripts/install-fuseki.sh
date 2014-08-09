distr=jena-fuseki-1.1.0
wget --quiet https://www.apache.org/dist/jena/binaries/$distr-distribution.tar.gz -O- | tar -zx --strip-components 1 -C /data/app/fuseki  $distr
