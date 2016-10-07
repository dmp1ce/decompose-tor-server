version: '2'
services:
  tor:
    #image: chriswayg/tor-server
    build:
      dockerfile: Dockerfile.tor
      context: .
{{#PRODUCTION}}
    restart: always
{{/PRODUCTION}}
    ports:
      - "9001:9001"
      - "9030:9030"
    volumes:
      ## mount custom torrc / secret_id_key here
      - ./torrc:/etc/tor/torrc
      - ./secret_id_key:/var/lib/tor/keys/secret_id_key

# vi: set tabstop=2 expandtab syntax=yaml: 
