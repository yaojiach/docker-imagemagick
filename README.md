# Docker ImageMagick

... that works

```sh
# Build and name
docker build -t imagemagick .
# docker build -t imagemagick:optional_tag .

# Use convert (run default convert; bind volume; imagemagick arguments)
docker run \
    -v "$(pwd)"/img:/imagemagick/img \
    imagemagick \
    /imagemagick/img/jucy-logo.png \
    -define icon:auto-resize=16,24,32,48,64 \
    /imagemagick/img/favicon.ico

# Other commands
docker run --entrypoint=identify -v "$(pwd)"/img:/imagemagick/img imagemagick /imagemagick/img/jucy-logo.png

# Interactive bash session
docker run -it --entrypoint="" -v "$(pwd)"/img:/imagemagick/img imagemagick /bin/bash
```