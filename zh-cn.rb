load_template "http://github.com/destinyd/rails-templates/raw/master/base.rb"
run "curl http://github.com/destinyd/rails-templates/raw/master/locales/zh-cn.yml -o config/locales/zh-cn.yml"
#run 'sed -i "s/# config.i18n.default_locale = :de/config.i18n.default_locale = :zh-cn/g" "grep '# config.i18n.default_locale = :de' -rl config/"'
run 'sed -i "s/# config.i18n.default_locale = :de/config.i18n.default_locale = :\"zh-cn\"/g" config/environment.rb'
