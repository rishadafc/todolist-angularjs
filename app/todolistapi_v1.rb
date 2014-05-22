require 'rubygems'
require 'grape'
require 'json'

class ToDoListApiV1 < Grape::API
  version 'v1'
  format :json
  resource :todo do

    get {ToDo.all.entries}

    params do
      optional :description, type: String
      optional :status, type: Boolean
    end

    post {Boolean.create!(params.slice(:description, :status))}
		
    route_param :id do
      get {ToDo.find params[:id]}
      put do
        user = ToDo.find params[:id]
        user.update_attributes!(params.slice(:name, :age, :email))
      end
      delete {ToDo.find(params[:id]).destroy}
    end
		
    delete {ToDo.destroy_all}
  end
end