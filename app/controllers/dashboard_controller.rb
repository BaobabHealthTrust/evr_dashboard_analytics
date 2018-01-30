class DashboardController < ApplicationController
	def index
		@births = Dashboard.births
		@total_births = @births.count
		
		@deaths = Dashboard.deaths
		@total_deaths = @deaths.count

		@population = Dashboard.population
		@total_population = @population.count
	end
end
