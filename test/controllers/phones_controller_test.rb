class PhonesControllerTest < ActionController::TestCase
  
  setup do
    @phone = phones(:first)
    @contact = contacts(:first)
  end

  test "should create phone" do
    assert_difference('Phone.count') do
      post :create, contact_id: @contact.id, phone: { name: 'Test' }
    end

    assert_redirected_to contact_path(assigns(:contact))
  end

  test "update phone" do
    patch :update, id: @phone, contact_id: @contact.id, phone: { name: @phone.name }
    assert_response :success
  end

  test "should destroy phone" do
    assert_difference('Phone.count', -1) do
      delete :destroy, id: @phone, contact_id: @contact.id
    end
    assert_redirected_to contact_path(@contact)
  end
end
