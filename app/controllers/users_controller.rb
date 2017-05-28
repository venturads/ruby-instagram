class UsersController < ApplicationController
    before_filter :authenticate_user!, :except => [:about]
    def show
        @user = User.find(params[:id])
    end
    
end
