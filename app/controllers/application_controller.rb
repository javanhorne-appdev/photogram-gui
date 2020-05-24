class ApplicationController < ActionController::Base
  def user_list

    render({:template => "pages/user_list.html.erb"})
  end

  def add_user_record
    user = User.new
    user.username = params.fetch("username")
    user.save
    redirect_to("/users/" + user.username, { :notice => "User created successfully." })
    
  end

  def user_profile
    username = params.fetch("username")
    @the_user = User.where({:username => username})[0]
    
    render({:template => "pages/user_profile.html.erb"})
  end

  def update_user_record
    user = User.where({:id => params.fetch("id")})[0]
    user.username = params.fetch("username")
    
    if user.valid?
      user.save
      redirect_to("/users/"+ user.username, { :notice => "User created successfully." })
    else
      redirect_to("/", { :notice => "User failed to create successfully." })
    end
  end


  def photo_list

    render({:template => "pages/photo_list.html.erb"})
  end

  def photo_details
    @the_photo = Photo.where({:id => params.fetch("id")})[0]
    render({:template => "pages/photo_details.html.erb"})
  end

  def update_photo
    @the_photo = Photo.where({:id => params.fetch("id")})[0]
    @the_photo.image = params.fetch("input_image")
    @the_photo.caption = params.fetch("input_caption")
          
    redirect_to("/photos/"+ photo.id, { :notice => "Photo updated successfully."})
  end

  def delete_photo
    @the_photo = Photo.where({:id => params.fetch("id")})[0]
    @the_photo.destroy
          
    redirect_to("/photos", { :notice => "Photo updated deleted."})
  end

  def insert_comment
    the_comment = Comment.new
    the_comment.photo_id = params.fetch("input_photo_id")
    the_comment.author_id = params.fetch("input_author_id")
    the_comment.body = params.fetch("input_body")
    the_comment.save

    redirect_to("/photos/" + params.fetch("input_photo_id"))
  end

  def insert_photo
    new_photo = Photo.new
    new_photo.image = params.fetch("input_photo_link")
    new_photo.caption = params.fetch("input_caption")
    new_photo.owner_id = params.fetch("input_owner_id")
    new_photo.save

    redirect_to("/photos/" + Photo.all.order({:id => :asc}).last.id.to_s )
  end
end
