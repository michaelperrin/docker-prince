FROM alpine:3.8

RUN mkdir /prince

WORKDIR /prince

RUN apk add --no-cache curl
RUN curl https://www.princexml.com/download/prince-12.4-alpine3.8-x86_64.tar.gz -o prince.tar.gz
RUN tar -zxvf prince.tar.gz

RUN apk add --no-cache \
  libxml2 \
  pixman \
  tiff \
  giflib \
  libpng \
  lcms2 \
  libjpeg-turbo \
  fontconfig \
  freetype \
  libgomp

# Install fonts
RUN apk --no-cache add msttcorefonts-installer fontconfig && \
    update-ms-fonts && \
    fc-cache -f

ENTRYPOINT [ "./prince-12.4-alpine3.8-x86_64/lib/prince/bin/prince" ]
