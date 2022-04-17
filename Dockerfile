# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jondeflo <jondeflo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/09 10:40:11 by jondeflo          #+#    #+#              #
#    Updated: 2020/08/09 15:13:26 by jondeflo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install mariadb-server
RUN apt-get -y install vim
RUN apt-get -y install nginx
RUN apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-curl php7.3-gmp php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap

COPY ./srcs/start_server.sh ./
COPY ./srcs/. ./tmp/

CMD bash start_server.sh