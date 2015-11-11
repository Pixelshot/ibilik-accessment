helpers SessionHelper

get '/' do
  @user = current_user #User.find_by(params[:id])
  @properties = Property.all
  erb :"static/index"
end