json.extract! funcionario, :id, :nome, :cargo, :user_id, :created_at, :updated_at
json.url funcionario_url(funcionario, format: :json)
