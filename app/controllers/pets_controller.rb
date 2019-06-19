class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do

    @pet = Pet.create(params[:pet])
    if !params["owner"]["name"].empty?
<<<<<<< HEAD
      @pet.owner = Owner.create(name: params["owner"]["name"])
=======
      @pet.owner << Owner.create(name: params["owner"]["name"])
>>>>>>> 5f30d6edfe2f52536c14d06f55973422d3bd2afe
    end
    @pet.save
    redirect to "pets/#{@pet.id}"
  end

<<<<<<< HEAD
  get '/pets/:id/edit' do
=======
  get '/pets/:id' do
>>>>>>> 5f30d6edfe2f52536c14d06f55973422d3bd2afe
    @pet = Pet.find(params[:id])
    @owners = Owner.all
    erb :'/pets/edit'
    end

<<<<<<< HEAD
  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    @owner = Owner.find_by_id(@pet.owner_id)
    erb :'/pets/show'
    end

  patch '/pets/:id' do
    @pet = Pet.find(params[:id])
    @pet.update(params[:pet])
    if params["owner"]["name"] != ""
      @pet.owner = Owner.create(name: params["owner"]["name"])
    end
    @pet.save
    redirect to "pets/#{@pet.id}"
  end
end

# patch '/pets/:id' do
#     if params["pet"]["owner_id"] && params[:owner][:name].empty?
#       @pet = Pet.find(params[:id])
#       @pet.name = params[:pet][:name]
#       @pet.owner_id = params[:pet][:owner_id]
#       @pet.save
#     else
#       @owner = Owner.create(params[:owner])
#       @pet = Pet.find(params[:id])
#       @pet.name = params["pet"]["name"]
#       @pet.owner = @owner
#       @pet.save
#     end
#     redirect to "pets/#{@pet.id}"
#   end
# end
=======
  patch '/pets/:id' do
    #######
    if !params[:pet].keys.include?("owner_ids")
    params[:pet]["owner_ids"] = []
    end
    #######

    @pet = Pet.find(params[:id])
    @pet.update(params["pet"])
    if !params["owner"]["name"].empty?
      @pet.owners << Owner.create(name: params["owner"]["name"])
    end
    redirect to "pets/#{@pet.id}"
  end
end
>>>>>>> 5f30d6edfe2f52536c14d06f55973422d3bd2afe
