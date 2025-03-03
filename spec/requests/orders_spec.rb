RSpec.describe "Orders API", type: :request do

  describe "GET /orders" do
    it "returns all orders" do
      create_list(:order, 3)
      get "/orders"

      expect(response).to have_http_status(:ok)
      data = JSON.parse(response.body)
      expect(data.size).to eq(3)
    end

    it "returns an empty list when there are no orders" do
      get "/orders"

      expect(response).to have_http_status(:ok)
      data = JSON.parse(response.body)
      expect(data.size).to eq(0)
    end
  end

  describe "GET /orders/:id" do
    it "returns the specified order" do
      order = create(:order, item_name: "Sample Item")
      get "/orders/#{order.id}"

      expect(response).to have_http_status(:ok)
      data = JSON.parse(response.body)
      expect(data["id"]).to eq(order.id)
      expect(data["item_name"]).to eq("Sample Item")
    end

    it "returns a 404 when the order does not exist" do
      get "/orders/9"

      expect(response).to have_http_status(:not_found)
    end
  end
end