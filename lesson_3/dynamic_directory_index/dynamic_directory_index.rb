
# When a user visits the root path, /, they should be presented with a listing 
# of all of the files in the public directory. The listing for a file should 
# only display the file's name and not the names of any directories.

# When a user clicks one of the filenames in the list, they should be taken 
# directly to that file. Take advantage of Sinatra's built-in serving of the 
# public directory.

# Add a parameter that controls the sort order of the files on the page. They 
# should be sorted in an ascending (A-Z) order by default, or descending (Z-A) 
# if the parameter has a certain value.

# Display a link to reverse the order. The text of the link should reflect the 
# order that will be displayed if it is clicked: "Sort ascending" or "Sort 
# descending".

require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

get "/" do
  @list_of_files = Dir.glob("public/*").map { |file| File.basename(file) }.sort
  @list_of_files.reverse! if params[:sort] == "reverse"

  erb :index
end