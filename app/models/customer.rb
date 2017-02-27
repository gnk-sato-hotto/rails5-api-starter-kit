class Customer < ApplicationRecord
  include FindDefault
  include ListParanoid
end
