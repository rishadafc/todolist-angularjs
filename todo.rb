require 'forgery'
Mongoid.load! "./mongoid.yml"

class ToDo
  include Mongoid::Document
  field :item, type: String, default: ->{Forgery(:lorem_ipsum).words(4)}
  field :user, type: String, default: ->{Forgery(:name).full_name}
end

class ToDoAPI < Grape::API
  format :json
  resource :todo do
    get {ToDo.all.entries}

    params do
      optional :item, type: String
      optional :user, type: String
    end
    post {ToDo.create!(params.slice(:item, :user))}

    route_param :id do
      get {ToDo.find params[:id]}
      put do
        todo = ToDo.find params[:id]
        todo.update_attributes!(params.slice(:item, :user))
      end
      delete {ToDo.find(params[:id]).destroy}
    end

    delete {ToDo.destroy_all}
  end
end
