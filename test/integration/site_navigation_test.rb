class SiteNavigationTest < ActionDispatch::IntegrationTest

  test "browse site" do
    get '/'
    assert_response :success

    get contact_path(contacts(:first))
    assert_response :success
  end


  test "export csv" do
    skip "needs to implement"
  end

  test "import csv" do
    skip "needs to implement"
  end

end
