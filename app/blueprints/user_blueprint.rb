
class UserBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
      fields :username, :email, :first_name, :last_name
    end
  
    view :blogs do 
      association :blogs, blueprint: BlogBlueprint, view: :normal
    end
  
  end
