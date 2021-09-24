require 'tilt/erubis'
require 'sinatra'
require 'sinatra/reloader'
require 'yaml'

# Add a new user to the users.yaml file. Verify that the site updates 
# accordingly.

before do
  @users = YAML.load_file('users.yml')
  @names = @users.keys.map(&:to_s).map(&:capitalize)
  @total_users = @users.size
end

helpers do
  def count_interests
    interests = []
    @users.each_value {|username| interests << username[:interests] }
    interests.flatten.uniq.count
  end

  def generate_user_page_links(user_list)
    link_list = ""
    user_list.each do |name|
      link_list <<  "<li><a href='/user_page/#{name}'>#{name}</a></li>"
    end

    link_list
  end
end

get '/' do
  redirect '/user_list'
end 

get '/user_list' do
  @title = "User List"
  erb :user_list
end

get '/user_page/:name' do
  @name = params['name'].capitalize
  redirect '/user_list' unless @names.include?(@name)

  @title = "About #{@name}"
  @current_user = @users[@name.downcase.to_sym]
  @email = @current_user[:email]
  @interests = @current_user[:interests]
  @other_users_names = @names.select { |name| name != @name }

  erb :user_page
end
