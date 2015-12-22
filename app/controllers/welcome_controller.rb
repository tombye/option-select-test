class WelcomeController < ApplicationController
  def index
    if params.include?('market_sector')
      @filters = params['market_sector'] 
    else
      @filters = []
    end

    @options = [
      {
        key: "agriculture-environment-and-natural-resources",
        title: "Agriculture, environment and natural resources"
      },
      {
        key: "building-and-construction",
        title: "Building and construction"
      },
      {
        key: "chemicals",
        title: "Chemicals"
      },
      {
        key: "clothing-footwear-and-fashion",
        title: "Clothing, footwear and fashion"
      },
      {
        key: "defence",
        title: "Defence"
      },
      {
        key: "distribution-and-service-industries",
        title: "Distribution and Service Industries"
      },
      {
        key: "electronics-industry",
        title: "Electronics Industry"
      },
      {
        key: "energy",
        title: "Energy"
      },
      {
        key: "engineering",
        title: "Engineering"
      },
      {
        key: "financial-services",
        title: "Financial services"
      },
      {
        key: "fire-police-and-security",
        title: "Fire, police, and security"
      },
      {
        key: "food-manufacturing",
        title: "Food manufacturing"
      },
      {
        key: "giftware-jewellery-and-tableware",
        title: "Giftware, jewellery and tableware"
      }
    ]

    def get_option_select_data(key: '', title: '', id: '', idx: '1')
      data = {
        key: key,
        title: title,
        options_container_id: "#{id}",
        closed_state_name: "#{id}_closed",
        options: []
      }

      if params.include?(data[:closed_state_name]) && params[data[:closed_state_name]] == "true"
        data[:closed_on_load] = true
      end

      @options.each do |option|
        data[:options].push(
          {
            value: "#{option[:key]}-#{idx}",
            label: "#{option[:title]}-#{idx}",
            id: "#{option[:key]}-#{idx}",
            checked: @filters.include?("#{option[:title]}-#{idx}")
          }
        )
      end

      return data
    end

    @option_select_1_data = get_option_select_data(key: "market_sector", title: "Market sector", id: "list_of_sectors-1", idx: "1")
    @option_select_2_data = get_option_select_data(key: "market_sector", title: "Market sector", id: "list_of_sectors-2", idx: "2")
    @option_select_3_data = get_option_select_data(key: "market_sector", title: "Market sector", id: "list_of_sectors-3", idx: "3")

  end
end
