name 'jjb_bootstrap'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'Apache2'
description 'Configures Jenkins Job builder'
long_description 'Configures Jenkins Job builder'
version '1.0.0'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
issues_url 'https://github.com/jjasghar/jjb_bootstrap/issues' if respond_to?(:issues_url)

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
source_url 'https://github.com/jjasghar/jjb_bootstrap' if respond_to?(:source_url)

depends 'jenkins'
