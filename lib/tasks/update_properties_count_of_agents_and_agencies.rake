namespace :update_properties_count_of_agents_and_agencies do
  desc 'Update number of available properties for agents and agencies'
  task update_agents_and_agency: :environment do
    Agency.all.each do |agency|
      if agency.properties.present?
        available_sold_properties_count = agency.properties.where(availability: 2).count
        available_rent_properties_count = agency.properties.where(availability: 1).count
        agency.update_attributes(num_of_sold_properties: available_sold_properties_count, num_of_rent_properties: available_rent_properties_count)
      end
    end
    Agent.all.each do |agent|
      if agent.properties.present?
        available_sold_properties_count = agent.properties.where(availability: 2).count
        available_rent_properties_count = agent.properties.where(availability: 1).count
        agent.update_attributes(num_of_sold_properties: available_sold_properties_count, num_of_rent_properties: available_rent_properties_count)
      end
    end
  end
end