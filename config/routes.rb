Rails.application.routes.draw do
  get("/", { :controller=>"application", :action=>"user_list"})
  get("/users", { :controller=>"application", :action=>"user_list"})
  get("/add_user_record", { :controller=>"application", :action=>"add_user_record"})
  get("/users/:username", { :controller=>"application", :action=>"user_profile"})
  get("/update_user_record/:id", { :controller=>"application", :action=>"update_user_record"})

  get("/photos", { :controller=>"application", :action=>"photo_list"})
  get("/photos/:id", { :controller=>"application", :action=>"photo_details"})
  get("/udpate_photo/:id", { :controller=>"application", :action=>"update_photo"})
  get("/delete_photo/:id", { :controller=>"application", :action=>"delete_photo"})
  get("/insert_comment", { :controller=>"application", :action=>"insert_comment"})
  get("/insert_photo", { :controller=>"application", :action=>"insert_photo"})
end
