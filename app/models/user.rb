class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         validates :sexo,
            :inclusion => { :in => [true, false] }
          validates :sexo,
            :presence => { :if => 'sexo.nil?' }
end
