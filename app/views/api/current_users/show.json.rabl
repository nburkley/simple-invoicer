object @current_user

attributes :id, :email

child :clients do
  attributes :name, :id, :name, :website
  child :contacts do
    attributes :name
  end
end

child :profile do
  attributes :company_name, :name, :id
end