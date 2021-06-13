crumb :root do
  link "Home", root_path
end
#indexからのパス----------------------------------------
crumb :myroom do
  link "Mypage", myroom_post_path(current_user.id)
  parent :root
end

crumb :login do
  link "Log_in", new_user_session_path
  parent :root
end

crumb :sign_up do
  link "Sign_up", new_user_registration_path
  parent :root
end

crumb :index_show do
  link "Show", user_path
  parent :root
end

crumb :post_edit do
  link "Post_edit", edit_myroom_path
  parent :index_show
end

crumb :post do
  link "Post", new_myroom_path
  parent :root
end

crumb :search do
  link "Search", search_posts_path
  parent :root
end
#indexからのパス------------------------------------------

#myroomからのパス-----------------------------------------
crumb :user_edit do
  link "User_edit", edit_user_registration_path
  parent :myroom
end

crumb :new_chatroom do
  link "New_chatroom", new_chatroom_path
  parent :myroom
end

crumb :followings_user1 do
  link "Followings_user", following_user_path
  parent :myroom
end

crumb :followers_user1 do
  link "Followers_user", followers_user_path
  parent :myroom
end

crumb :myroom_show do
  link "Show", user_path
  parent :myroom
end

crumb :chatroom do
  link "Chatroom", new_chatroom_message_path
  parent :myroom
end
#myroomからのパス-----------------------------------------


#showページからのフォロー、フォロワー一覧--------------------------
crumb :followings_user do
  link "Followings_user", following_user_path
  parent :index_show
end

crumb :followers_user do
  link "Followers_user", followers_user_path
  parent :index_show
end
#showページからのフォロー、フォロワー一覧--------------------------

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).