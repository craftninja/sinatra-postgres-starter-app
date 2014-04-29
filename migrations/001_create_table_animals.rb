Sequel.migration do
  up do
    create_table(:animals) do
      primary_key :id
      String :name, :null=>false
    end
  end

  down do
    drop_table(:animals)
  end
end
