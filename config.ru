require 'bundler/setup'
Bundler.require(:default)

$:.unshift "./app"
require 'todolistapi_v1'
run ToDoListApiV1
