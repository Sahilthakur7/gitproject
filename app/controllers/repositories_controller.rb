class RepositoriesController < ApplicationController
    before_action :set_user

    def index
        @repositories = @user.repositories.all
    end

    def new
        @repository = current_user.repositories.new
    end

    def create
        @repository = current_user.repositories.new(repository_params)
        if @repository.save!
            redirect_to user_repositories_path(current_user)
        end
    end

    private

    def set_user
        @user = User.find(params[:user_id])
    end

    def repository_params
        params.require(:repository).permit(:name,:language,:description)
    end
end
