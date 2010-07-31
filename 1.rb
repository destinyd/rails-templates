generate :nifty_layout

git :init

run "echo 'TODO add readme content' > README"
run "touch tmp/.gitignore log/.gitignore"
run "cp config/database.yml config/example_database.yml"

file ".gitignore", <<-END
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END

git :add => ".", :commit => "-m 'initial commit'"


