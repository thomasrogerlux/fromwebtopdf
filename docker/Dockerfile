FROM ubuntu:17.10
LABEL maintainer="thomasrogerlux@outlook.fr"

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y libssl-dev libxrender1 fontconfig xvfb wget xz-utils bc parallel
RUN apt-get install -y fonts-noto-cjk fonts-noto-cjk-extra fonts-thai-tlwg fonts-open-sans

RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz -P /tmp
RUN tar xf /tmp/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz -C /tmp
RUN cp /tmp/wkhtmltox/bin/wkhtmltopdf /usr/bin/wkhtmltopdf
