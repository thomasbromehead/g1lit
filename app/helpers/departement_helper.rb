module DepartementHelper
  def departement(flat)
    flat.zip_code.slice(0,2)
  end
end
