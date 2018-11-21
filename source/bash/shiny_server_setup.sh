#!/usr/bin/env bash
# from https://tm3.ghost.io/2017/12/31/deploying-an-r-shiny-app-to-aws/
# https://www.r-bloggers.com/shiny-server-on-aws/

### dependencies
sudo apt-get update
sudo apt-get -y install nginx gdebi-core apache2-utils pandoc pandoc-citeproc libssl-dev libcurl4-gnutls-dev \
libcairo2-dev libgdal-dev libgeos-dev libproj-dev libxml2-dev libxt-dev libv8-dev


### not sure about this part
# sudo vi /etc/apt/sources.list
# deb https://cloud.r-project.org/bin/linux/ubuntu xenial/
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -


### install r
sudo apt-get update
sudo apt-get -y install r-base


### install packages
# replace with other list, tidyverse
sudo su - -c "R -e \"install.packages(c('shiny', 'rmarkdown', 'shinydashboard', 'shinyjs'), repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages(c('ggplot2', 'dplyr', 'tidyr', 'lazyeval', 'stringr', 'ggthemes', 'ggExtra', 'magrittr', 'viridis', 'gridExtra', 'lubridate', 'fasttime', 'data.table'), repos='http://cran.rstudio.com/')\""
# sudo su - -c "R -e \"install.packages(c('readr'), repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages(c('XML'), repos='http://cran.rstudio.com/')\""

# https://github.com/tidyverse/readr/issues/544
#apt-get update     # refresh
#apt-get install software-properties-common
#add-apt-repository -y "ppa:marutter/rrutter"
#add-apt-repository -y "ppa:marutter/c2d4u"
#apt-get update     # now with new repos
#apt-get install r-cran-readr

# not sure why fails
# sudo add-apt-repository -y ppa:opencpu/jq
# sudo apt-get update
# sudo apt-get -y install libjq-dev
# sudo su - -c "R -e \"install.packages(c('sp', 'rgdal', 'rgeos', 'adehabitatHR', 'geojsonio', 'maptools'), repos='http://cran.rstudio.com/')\""
# sudo su - -c "R -e \"install.packages(c('leaflet', 'highcharter', 'DT'), repos='http://cran.rstudio.com/')\""


### download files
mkdir server_setup
cd server_setup
wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.9.923-amd64.deb
wget https://download2.rstudio.org/rstudio-server-1.1.463-amd64.deb

### install shiny server
sudo gdebi shiny-server-1.5.9.923-amd64.deb

### install rstudio server
sudo gdebi rstudio-server-1.1.463-amd64.deb


### nginx
sudo service nginx stop
# sudo stop shiny-server
sudo systemctl stop shiny-server

# sudo nano /etc/nginx/sites-available/default
#server {
#    listen 80;
#
#    location / {
#    proxy_pass http://127.0.0.1:3838/;
#    proxy_redirect http://127.0.0.1:3838/ $scheme://$host/;
#    proxy_http_version 1.1;
#    proxy_set_header Upgrade $http_upgrade;
#    proxy_set_header Connection "upgrade";
#    auth_basic "Username and Password are required";
#    auth_basic_user_file /etc/nginx/.htpasswd;
# }
#}

# sudo nano /etc/shiny-server/shiny-server.conf
## Instruct Shiny Server to run applications as the user "shiny"
#run_as shiny;
#
## Define a server that listens on port 3838
#server {
#  listen 3838 127.0.0.1;
#
#  # Define a location at the base URL
#  location / {
#
#    # Host the directory of Shiny Apps stored in this directory
#    site_dir /srv/shiny-server;
#
#    # Log all Shiny output to files in this directory
#    log_dir /var/log/shiny-server;
#
#    # When a user visits the base URL rather than a particular application,
#    # an index of the applications available in this directory will be shown.
#    directory_index on;
#  }
#}



cd /etc/nginx
sudo htpasswd -c /etc/nginx/.htpasswd stedogin  # SN

sudo systemctl start shiny-server
sudo service nginx start

sudo passwd ubuntu  # SN


### app deployment
cd /srv/shiny-server
sudo chmod 7777 /srv/shiny-server/
sudo mkdir
sudo apt-get -y install git
git clone https://github.com/chrisrzhou/RShiny-BoxOfficeMojo.git