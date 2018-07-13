require './config/environment'

#if ActiveRecord::Migrator
  #raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
#end

use UsersController
use EntriesController
run ApplicationController
