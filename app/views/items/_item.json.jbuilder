json.extract! item, :id, :order_id, :dish_id, :quantity, :created_at, :updated_at
json.url item_url(item, format: :json)
