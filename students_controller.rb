require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index

get '/students' do
  @students = Student.all()
  @houses = House
  erb(:home)
end

# new

get '/students/new' do
  erb(:new)
end

# show

get '/students/:id' do
  @student = Student.find(params[:id])
  @houses = House
  erb(:show)
end

# create

post "/students" do
  @student = Student.new(params)
  @student.save
  erb(:create)
end

# edit

get "/students/:id/edit" do
  @student = Student.find(params[:id])
  @houses = House.all
  erb(:edit)
end

# update

post "/students/:id" do
  Student.new(params).update
  redirect to '/students'
end

# destroy

post "/students/:id/delete" do
  student = Student.find(params[:id])
  student.delete()
  redirect to '/students'
end
