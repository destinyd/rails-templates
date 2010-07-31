generate :nifty_layout

run "echo 'TODO add readme content' > README"
run "cp config/database.yml config/database.yml.example"

run "rm public/index.html"
run "rm public/favicon.ico"
run "rm public/robots.txt"
run "rm public/images/rails.png"
run "rm -f public/javascripts/*"
# Download JQuery
run "curl -s -L http://jqueryjs.googlecode.com/files/jquery-1.3.1.min.js > public/javascripts/jquery.js"
run "curl -s -L http://jqueryjs.googlecode.com/svn/trunk/plugins/form/jquery.form.js > public/javascripts/jquery.form.js"

git :init

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"

gem "formtastic"
rake "gems:install",:sudo => true
generate :formtastic

plugin 'will_paginate', :git => 'git://github.com/mislav/will_paginate.git'
plugin 'validation_reflection',:git => 'git://github.com/redinger/validation_reflection.git'

run 'sed -i "s/stylesheet_link_tag \'application\' /stylesheet_link_tag \'application\',\'formtastic\',\'formtastic_change\' /g" app/views/layouts/application.html.erb'


file ".gitignore", <<-END
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
db/*.db
db/schema.rb
.DS_Store
doc/api
doc/app
public/javascripts/all.js
public/stylesheets/all.js
nbproject/**/*
END

git :add => "."
git :commit => "-m 'initial commit'"


