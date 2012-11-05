object @user

attributes :id, :email

child :clients do
  attributes :name
end

child :profile do
  attributes :company_name
end