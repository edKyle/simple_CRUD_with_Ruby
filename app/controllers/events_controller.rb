class EventsController < ApplicationController

	def index
		@events = Event.all
	end

	def new
		@event = Event.new
	end

	#post/ events/ create
	def create
		@event = Event.new(event_parms)
		@event.save

		redirect_to :action => :index #告訴瀏覽器 HTTP code: 303
	end

	#show data detail
	def show
		@data = Event.find(params[:id])
	end
    
    #get /events/edit/:id
	def edit
		@data = Event.find(params[:id])
	end

	#get /events/update/:id
	def update
		@data = Event.find(params[:id])
		@data.update(event_parms)

		redirect_to :action => :show, :id => @data
	end

	def destroy 
		@data = Event.find(params[:id])
		@data.destroy

		redirect_to :action => :index #告訴瀏覽器 HTTP code: 303
	end

	private
		def event_parms
			params.require(:event).permit(:name, :description)
		end

end
