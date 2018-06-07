module FavouritesHelper

  def favourite_link(resource)
    if (user_signed_in?) && (current_user.likes? resource)
      link_to unfavourite_path(resource_name: resource.class,
        resource_id: resource.id),
        method: :delete do
          tag.i class: %w( fa fa-star )
        end
    else
      link_to favourite_path(resource_name: resource.class,
        resource_id: resource.id),
        method: :post do
          tag.i class: %w( fa fa-star-o )
        end
    end
  end

end
