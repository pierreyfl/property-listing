module PropertiesHelper

  def property_types
    tags = ''
    Property.types.each do |k,v|
      tags << check_box_tag("type[#{k}]").to_s
      tags << label_tag("type[#{k}]",k).to_s
    end
    tags.html_safe
  end

end
