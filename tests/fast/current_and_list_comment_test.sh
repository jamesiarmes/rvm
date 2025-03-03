source "$rvm_path/scripts/rvm"

rvm try_install 2.4.0
rvm try_install 2.6.6
rvm try_install 2.4.1

: separate default/current
rvm use 2.4.0@abc-test --create --default
# status=0
# match=/Using .*ruby-2.4.0 with gemset abc-test/
rvm current
# match=/ruby-2.4.0@abc-test/

rvm use 2.6.6@abc-test --create
# status=0
# match=/Using .*ruby-2.6.6 with gemset abc-test/
rvm current
# match=/ruby-2.6.6@abc-test/

rvm list
# match=/^ \* ruby-2.4.0/
# match=/^=> ruby-2.6.6/

: default == current
rvm use 2.4.1@abc-test --create --default
# status=0
# match=/Using .*ruby-2.4.1 with gemset abc-test/
rvm current
# match=/ruby-2.4.1@abc-test/

rvm list
# match=/^=\* ruby-2.4.1/
