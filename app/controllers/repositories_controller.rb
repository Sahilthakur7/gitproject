class RepositoriesController < ApplicationController
    before_action :set_user

    def index
        @repositories = @user.repositories.all
    end

    def new
        @repository = current_user.repositories.new
    end

    private

    def set_user
        @user = User.find(params[:user_id])
    end
end
