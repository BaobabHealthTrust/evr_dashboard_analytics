require 'rest-client'

class Dashboard < ApplicationRecord
	def self.births
		start_date = Dashboard.dashboard_period[0]
		end_date = Dashboard.dashboard_period[1]
		
		settings = YAML.load_file("#{Rails.root}/config/dde_connection.yml")[Rails.env] rescue {}
		births_url = "http://#{settings['dde_username']}:#{settings['dde_password']}@#{settings['dde_server']}/retrieve_dashboard_births"
		response = RestClient.post births_url, {'start_date' => start_date, 'end_date' => end_date}, timeout: 10
		
		return JSON.parse(response)
	end
	
	def self.deaths
		start_date = Dashboard.dashboard_period[0]
		end_date = Dashboard.dashboard_period[1]
		
		settings = YAML.load_file("#{Rails.root}/config/dde_connection.yml")[Rails.env] rescue {}
		deaths_url = "http://#{settings['dde_username']}:#{settings['dde_password']}@#{settings['dde_server']}/retrieve_dashboard_deaths"
		response = RestClient.post deaths_url, {'start_date' => start_date, 'end_date' => end_date}, timeout: 10
		
		return JSON.parse(response)
	end
	
	def self.population
		start_date = Dashboard.dashboard_period[0]
		end_date = Dashboard.dashboard_period[1]
		
		settings = YAML.load_file("#{Rails.root}/config/dde_connection.yml")[Rails.env] rescue {}
		population_url = "http://#{settings['dde_username']}:#{settings['dde_password']}@#{settings['dde_server']}/population_stats"
		population_parameters = {district: settings['district'], ta: settings['ta'], stat: 'ta_population_tabulation'}
		response = RestClient.post population_url, population_parameters, timeout: 10
		
		return JSON.parse(response)
	end
	
	def self.dashboard_period
		date_today = Date.today
		start_date = date_today.beginning_of_month
		end_date = date_today.end_of_month
		
		return start_date.strftime("%Y-%m-%d"),end_date.strftime("%Y-%m-%d")
	end
end
