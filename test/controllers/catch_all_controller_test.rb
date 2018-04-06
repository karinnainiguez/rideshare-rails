require "test_helper"

describe CatchAllController do
  it "should get index" do
    get catch_all_index_url
    value(response).must_be :success?
  end

end
