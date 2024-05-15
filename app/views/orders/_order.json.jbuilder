json.extract! order, :id, :sub_total, :taxes, :total, :created_at, :updated_at
json.url order_url(order, format: :json)
