class StoriesController < ApplicationController

	def index
		@stories = Story.all
	end

	def show
		@story = Story.find(params[:id])
	end

	def new
		@story = Story.new
	end 

	def create
		@story = Story.new(params.require(:story).permit(:title, :content))
		if @story.save
			redirect_to stories_path
		else
			render 'new'
		end
	end

	def edit
		@story = Story.find(params[:id])
	end

	def update
		@story = Story.find(params[:id])
		if @story.update_attributes(params.require(:story).permit(:title, :content))
			redirect_to stories_path
		else
			render 'edit'
		end
	end

		def destroy
			@story = Story.find(params[:id])
			@story.destroy
			redirect_to stories_path
		end

end
