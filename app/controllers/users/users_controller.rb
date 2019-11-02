class UsersController < ApplicationController
def new
end

def create
    @foo = Foo.new(foo_params)
    if verify_recaptcha(model: @foo, env: Rails.env) && @foo.save
      redirect_to @foo
    else
      render 'new'
    end
  end

end
