class PlockController < Devise::RegistrationsController
  def new
    binding.pry
    super
  end

  def create
    # add custom create logic here
  end

  def update
    super
  end
end
