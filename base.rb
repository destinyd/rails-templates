generate :nifty_layout

git :init

gem "formtastic"
rake "gems:install"
generate :formtastic

run 'sed -i "s/stylesheet_link_tag \'application\' /stylesheet_link_tag \'application\',\'formtastic\',\'formtastic_change\' /g" app/views/layouts/application.html.erb'

run "echo 'TODO add readme content' > README"
run "touch tmp/.gitignore log/.gitignore"
run "cp config/database.yml config/example_database.yml"
git :rm => "public/images/rails.png"
run :rm => "public/index.html"

file ".gitignore", <<-END
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END

git :add => "."
git :commit => "-m 'initial commit'"


