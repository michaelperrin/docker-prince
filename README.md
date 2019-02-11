# Prince XML Docker image

[Prince](https://www.princexml.com/) is a great tool that converts HTML to PDF with support of CSS print features that no browser supports for now (eg. page number generation, specific content for odd or even pages, and other `@page` content).

## Usage example

    docker run --rm \
        -v "`pwd`":/data
        michaelperrin/prince:latest \
        -o /data/test.pdf \
        /data/index.html

### Using Docker Compose

    # docker-compose.yml
    version: '3'
    services:
      prince:
        image: michaelperrin/prince:latest
        volumes:
          - .:/data

Run:

    docker-compose run --rm prince \
        -o /data/test.pdf \
        /data/index.html
