FROM alpine:3.13

RUN mkdir /prince

WORKDIR /prince

RUN apk add --no-cache curl
RUN curl https://www.princexml.com/download/prince-14.2-alpine3.13-x86_64.tar.gz -o prince.tar.gz
RUN tar -zxvf prince.tar.gz
RUN rm prince.tar.gz

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

ENTRYPOINT [ "./prince-14.2-alpine3.13-x86_64/lib/prince/bin/prince" ]
