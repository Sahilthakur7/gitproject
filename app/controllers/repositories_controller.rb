class RepositoriesController < ApplicationController
    include Rails.application.routes.url_helpers

    before_action :set_user

    def index
        @repositories = @user.repositories.all.order("updated_at DESC")
    end

    def show
        @repository = Repository.find(params[:id])
        @count = (@repository.code_files.count / 2 )
    end

    def new
        @repository = current_user.repositories.new
    end

    def create
        @repository = current_user.repositories.new(repository_params)
        @repository.code_files.attach(params[:repository][:code_files])
        if @repository.save!
            redirect_to user_repositories_path(current_user)
        end
    end

    def download
        @repository = @user.repositories.find(params[:id])
        @repository.code_files.each do |file|
            send_file rails_blob_path(file.blob, disposition: "attachment")
            # send_data rails_blob_path(file)
            # send_file file.service_url
            # file.download
            # send_file url_for(file)
            # send_file Rails.application.routes.url_helpers.rails_blob_path(file,only_path: true)
            # send_file rails_blob_url(file.blob)
        end
        redirect_to user_repository_path(current_user,@repository)
    end

    private

    def set_user
        @user = User.find(params[:user_id])
    end

    def repository_params
        params.require(:repository).permit(:name,:language,:description,code_files: [])
    end
end
