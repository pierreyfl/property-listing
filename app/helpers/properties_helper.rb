module PropertiesHelper

  def amenities
    [
      'Air Conditioning',
      'Swimming Pool',
      'Central Heating',
      'Laundry Room',
      'Gym',
      'Alarm',
      'Window Covering'
    ]
  end

  def amenities_check_list_helper
    tags = ''
    amenities.each_with_index do |amenity, index|
      tags << tag.input(type: 'checkbox', name: "amenities[#{amenity.downcase.tr(' ', '_')}]", id: "check-#{index + 2}").to_s
      tags << tag.label(amenity, for: "check-#{index + 2}").to_s
    end
    tags.html_safe
  end

end
