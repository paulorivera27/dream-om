require 'json'
start_time = Time.now

puts 'First we are going to clear data and some land seeds...'

Plot.destroy_all

puts 'Adding new plots... please wait until the operation is completed'
puts 'This could take some time....'

puts 'Preparing files for the operation...'

filepaths = [
  './app/assets/files/land_london_radius50_page1.json',
  './app/assets/files/land_london_radius50_page2.json'
]

puts 'Initializing...'



def land_seeding(file_path)
  plot_counter = 0
  plot_index = 0

  plotsfile = File.read(file_path)

  plots = JSON.parse(plotsfile)

  puts 'Excluding plots without needed data...'

  filtered_plots = plots['listing'].reject do |plot|
    plot['description'] =~ /commercial/i ||
    plot['short_description'] =~ /commercial/i ||
    plot['short_description'] =~ /flat/i ||
    plot['short_description'] =~ /apartment/i ||
    plot['image_645_430_url'] == nil ||
    plot['agent_phone'] == "" ||
    Plot.exists?(listing_id: plot['listing_id']) ||
    plot['price'] == 0
  end

  puts 'Fetching data and adding plots....'

  filtered_plots.each do |plot|
    # ownership_type = if plot['description'].match?(/share of freehold/i)
    #   'Share of Freehold'
    # elsif plot['description'].match?(/leasehold/i)
    #   'Leasehold'
    # elsif plot['description'].match?(/freehold/i)
    #   'Freehold'
    # else
    #   nil
    # end

    ownership_type = case plot['description']
    when /share of freehold/i
      'Share of Freehold'
    when /leasehold/i
      'Leasehold'
    when /freehold/i
      'Freehold'
    else
      nil
    end

    if plot_size = plot['description'].match(/(\d?.?\d+\sacres)/i) ||
                   plot['description'].match(/(\d?.?\d+\sacre)/i) ||
                   plot['description'].match(/(\d?.?\d+\ssq\sft)/i)
    else
      plot_size = ""
    end


    Plot.create!(
      num_floors:  plot['num_floors'],
      num_bedrooms:  plot['num_bedrooms'],
      property_type:  plot['property_type'],
      description:  plot['description'],
      post_town:  plot['post_town'],
      details_url:  plot['details_url'],
      outcode:  plot['outcode'],
      image_urls:  [ plot['image_645_430_url'] ],
      price:  plot['price'],
      listing_id:  plot['listing_id'],
      agent_name:  plot['agent_name'],
      num_recepts:  plot['num_recepts'],
      first_published_date:  plot['first_published_date'],
      address:  plot['displayable_address'],
      floor_plan_url:  plot['floor_plan'],
      street_name:  plot['street_name'],
      num_bathrooms:  plot['num_bathrooms'],
      price_change:  plot['price_change'],
      agent_phone:  plot['agent_phone'],
      last_published_date:  plot['last_published_date'],
      location:  plot['county'],
      latitude: plot['latitude'],
      longitude: plot['longitude'],
      plan_granted: plot['description'].match?(/planning consent granted/i)  ||
      plot['description'].match?(/Planning Application Number/i)||
      plot['description'].match?(/Planning Permission granted/i),
      ownership_type: ownership_type,
      plot_size: plot_size
     )
    plot_counter += 1
    puts "Created #{plot_counter} plot/s "
  end
end

filepaths.each do |f|
  puts '=' * 30
  puts "=== working on file #{f}... ==="
  puts '=' * 30
  land_seeding(f)
end

system 'clear'

'=' * 30
puts 'Now injecting subject to modernisation houses.... please wait.'
'=' * 30


filepaths2 = ['./app/assets/files/houses_london_radius50_modernisation_page1.json', './app/assets/files/houses_london_radius50_modernisation_page2.json']


def house_seeding(file_path)
  house_counter = 0
  house_index = 0

  housesfile = File.read(file_path)

  houses = JSON.parse(housesfile)

  puts 'Excluding houses without needed data...'

  filtered_houses = houses['listing'].reject do |house|
    house['description'] =~ /have undergone a full programme of modernisation/i ||
    house['description'] =~ /have undergone modernisation/i ||
    house['description'] =~ /modernised/i ||
    house['description'] =~ /modernised/i ||
    house['short_description'] =~ /commercial/i ||
    house['image_645_430_url'] == nil ||
    house['agent_phone'] == "" ||
    Plot.exists?(listing_id: house['listing_id']) ||
    house['price'] == 0
  end

  puts 'Fetching data and adding houses....'

  filtered_houses.each do |house|

    ownership_type = case house['description']
    when /share of freehold/i
      'Share of Freehold'
    when /leasehold/i
      'Leasehold'
    when /freehold/i
      'Freehold'
    else
      nil
    end

    if plot_size = house['description'].match(/(\d?.?\d+\sacres)/i) ||
                   house['description'].match(/(\d?.?\d+\sacre)/i) ||
                   house['description'].match(/(\d?.?\d+\ssq\sft)/i)
    else
      plot_size = ""
    end


    floor_size = if house['floor_area'].nil? || house['floor_area']['max_floor_area'].nil?
      nil
     else
      "#{house['floor_area']['max_floor_area']['value']}, #{house['floor_area']['max_floor_area']['units']}"
    end

    property_type = house['property_type'].empty? ? '' : house['property_type']

    Plot.create!(
      num_floors:            house['num_floors'],
      num_bedrooms:          house['num_bedrooms'],
      property_type:         property_type,
      description:           house['description'],
      post_town:             house['post_town'],
      details_url:           house['details_url'],
      outcode:               house['outcode'],
      image_urls:             [ house['image_645_430_url'] ],
      price:                 house['price'],
      listing_id:            house['listing_id'],
      agent_name:            house['agent_name'],
      num_recepts:           house['num_recepts'],
      first_published_date:  house['first_published_date'],
      address:               house['displayable_address'],
      floor_plan_url:        house['floor_plan'],
      street_name:           house['street_name'],
      num_bathrooms:         house['num_bathrooms'],
      price_change:          house['price_change'],
      agent_phone:           house['agent_phone'],
      last_published_date:   house['last_published_date'],
      location:              house['county'],
      latitude:              house['latitude'],
      longitude:             house['longitude'],
      plan_granted:          house['description'].match?(/planning consent granted/i)  ||
      house['description'].match?(/Planning Application Number/i)||
      house['description'].match?(/Planning Permission granted/i),
      ownership_type: ownership_type,
      floor_size:            floor_size,
      plot_size: plot_size
     )
    house_counter += 1
    puts "Created #{house_counter} house/s "
  end
end

filepaths2.each do |f|
  puts '=' * 30
  puts "=== working on file #{f}... ==="
  puts '=' * 30
  house_seeding(f)
end

system 'clear'

'=' * 30
puts 'Now injecting Refurbishment houses.... please wait.'
'=' * 30


filepaths3 = ['./app/assets/files/houses_london_radius1_refurbishment_page1.json', './app/assets/files/houses_london_radius1_refurbishment_page2.json', './app/assets/files/houses_london_radius1_refurbishment_page3.json', './app/assets/files/houses_london_radius1_refurbishment_page5.json', './app/assets/files/houses_london_radius1_refurbishment_page8.json', './app/assets/files/houses_london_radius1_refurbishment_page13.json']


def refurb_house_seeding(file_path)
  house_counter = 0
  house_index = 0

  housesfile = File.read(file_path)

  houses = JSON.parse(housesfile)

  puts 'Excluding houses without needed data...'

  filtered_houses = houses['listing'].reject do |house|
    house['description'] =~ /have undergone a full programme of modernisation/i ||
    house['description'] =~ /have undergone modernisation/i ||
    house['description'] =~ /refurbished/i ||
    house['description'] =~ /newly refurbished/i ||
    house['description'] =~ /has been refurbished/i ||
    house['description'] =~ /completely refurbished/i ||
    house['description'] =~ /modernised/i ||
    house['description'] =~ /has been recently refurbished/i ||
    house['description'] =~ /recently refurbished/i ||
    house['description'] =~ /having been refurbished/i ||
    house['description'] =~ /has undergone extensive refurbishment/i ||
    house['description'] =~ /has undergone major refurbishment/i ||
    house['description'] =~ /has undergone refurbishment/i ||
    house['short_description'] =~ /commercial/i ||
    house['image_645_430_url'] == nil ||
    Plot.exists?(listing_id: house['listing_id']) ||
    house['agent_phone'] == "" ||
    house['price'] == 0
  end

  puts 'Fetching data and adding houses....'

  filtered_houses.each do |house|

    ownership_type = case house['description']
    when /share of freehold/i
      'Share of Freehold'
    when /leasehold/i
      'Leasehold'
    when /freehold/i
      'Freehold'
    else
      nil
    end

    if plot_size = house['description'].match(/(\d?.?\d+\sacres)/i) ||
                   house['description'].match(/(\d?.?\d+\sacre)/i) ||
                   house['description'].match(/(\d?.?\d+\ssq\sft)/i)
    else
      plot_size = ""
    end

    floor_size = if house['floor_area'].nil? || house['floor_area']['max_floor_area'].nil?
      nil
     else
      "#{house['floor_area']['max_floor_area']['value']}, #{house['floor_area']['max_floor_area']['units']}"
    end

    property_type = house['property_type'].empty? ? '' : house['property_type']

    Plot.create!(
      num_floors:            house['num_floors'],
      num_bedrooms:          house['num_bedrooms'],
      property_type:         property_type,
      description:           house['description'],
      post_town:             house['post_town'],
      details_url:           house['details_url'],
      outcode:               house['outcode'],
      image_urls:             [ house['image_645_430_url'] ],
      price:                 house['price'],
      listing_id:            house['listing_id'],
      agent_name:            house['agent_name'],
      num_recepts:           house['num_recepts'],
      first_published_date:  house['first_published_date'],
      address:               house['displayable_address'],
      floor_plan_url:        house['floor_plan'],
      street_name:           house['street_name'],
      num_bathrooms:         house['num_bathrooms'],
      price_change:          house['price_change'],
      agent_phone:           house['agent_phone'],
      last_published_date:   house['last_published_date'],
      location:              house['county'],
      latitude:              house['latitude'],
      longitude:             house['longitude'],
      plan_granted:          house['description'].match?(/planning consent granted/i)  ||
      house['description'].match?(/Planning Application Number/i)||
      house['description'].match?(/Planning Permission granted/i),
      ownership_type: ownership_type,
      floor_size:            floor_size,
      plot_size: plot_size
     )
    house_counter += 1
    puts "Created #{house_counter} house/s "
  end
end

filepaths3.each do |f|
  puts '=' * 30
  puts "=== working on file #{f}... ==="
  puts '=' * 30
  refurb_house_seeding(f)
end

ending = Time.now
elapsed = ending - start_time
puts "Elapsed time: #{elapsed}/Seconds"
