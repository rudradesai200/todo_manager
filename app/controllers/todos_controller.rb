class TodosController < ApplicationController
  def index
    render plain: "This is a /todos!"
  end
end
