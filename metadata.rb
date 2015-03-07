
name             'web-base'
maintainer       'knehring'
maintainer_email 'knehring@gmail.com'
license          'All rights reserved'
description      'Installs/Configures web-base'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "apache2"
depends "apt"
depends "php"
