Mongoid.load! "./mongoid.yml"

class ToDo
  include Mongoid::Document
  field :description, type: String, default: "This is a ToDo."
  field :status, type: Boolean, default: false
end