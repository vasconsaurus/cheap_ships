class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # before_action :configure_permitted_parameters, if: :devise_controller?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :vehicles, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one_attached :photo
end
