require 'rest-client'

class Dashboard < ApplicationRecord
	def self.births
		settings = YAML.load_file("#{Rails.root}/config/dde_connection.yml")[Rails.env] rescue {}
		births_url = "http://#{settings['dde_username']}:#{settings['dde_password']}@#{settings['dde_server']}/retrieve_dashboard_births"
		response = RestClient.post births_url, {'start_date' => '2018-01-1', 'end_date' => '2018-01-31'}
		
		return JSON.parse(response)
	end
	
	def self.deaths
		settings = YAML.load_file("#{Rails.root}/config/dde_connection.yml")[Rails.env] rescue {}
		deaths_url = "http://#{settings['dde_username']}:#{settings['dde_password']}@#{settings['dde_server']}/retrieve_dashboard_deaths"
		response = RestClient.post deaths_url, {'start_date' => '2018-01-1', 'end_date' => '2018-01-31'}
		
		return JSON.parse(response)
	end
	
	def self.population
		settings = YAML.load_file("#{Rails.root}/config/dde_connection.yml")[Rails.env] rescue {}
		population_url = "http://#{settings['dde_username']}:#{settings['dde_password']}@#{settings['dde_server']}/population_stats"
		population_parameters = {district: settings['district'], ta: settings['ta'], stat: 'ta_population_tabulation'}
		response = RestClient.post population_url, population_parameters
		
		return JSON.parse(response)
	end
end
