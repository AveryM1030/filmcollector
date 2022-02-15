class ActorsController < ApplicationController
	# index method gets called when the actors URL is requested.
	# index method gets mapped to the actors index.html.erb.
	def index
		# call all method on Actor model class.
		# all method selects all of the data in the actor table
		# and returns the data as an array of objects.
		# store the array of objects in an instance variable.
		# instance varialbe is avaliable to actors index.html.erb.
		@actors = Actor.all
	end

	# new method gets called when the actors/new URL is requested.
	# new method is mnapped to the actors new.html.erb.
	def new
	end

	# create method gets called when the Create button is pushed on
	# the actors new.hthml.erb.
	def create
		# call constructor of Actor model class giving it the 
		# first name and last name paramters input in the actors
		# new.html.erb
		# constructo create Actor model object which is stored
		# in variable
		actor = Actor.new(actor_params)
		# call save method on Actor object
		# save method inserts the data in the Actor model object
		# into the actor table
		if actor.save
			# if the save method succeeds, request the actors URL
			# which will rendor the actors index.html.erb in the browser
			redirect_to "/actors"
		else
			# get full message associated with errors
			# store them in a Rails flash object names errirs so that 
			# the full messages may be displayed in the actors new.html.erb
			flash[:errors] = actor.errors.full_messages
			# if the save method fails, request the actors/new URL
			# which will rendor the actors new.html.erb in the browser
			redirect_to "/actors/new"
	end
end

# show method gets called when the actors/:id URL is requested
# show method is mapped to the actors show.html.erb
def show
	# call find method on Acotr model class giving it the id sent
	# in the request
	# find method selects all of the data in the actor table where
	# the id is equal to the id sent in the request
	# selected data will be returned in a array of movie object
	# store the array of movie objectys in a instance variable
	# instance variable is available to actors show.html.erb
	@movies = Actor.find(params[:id]).movies
	end

	private
	def actor_params
		# params is a Rails onject that gets the specified request
		# paramters
		params.require(:actor).permit(:first_name, :last_name)
	end
end
