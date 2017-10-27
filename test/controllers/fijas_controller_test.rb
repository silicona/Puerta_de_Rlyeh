require 'test_helper'

class FijasControllerTest < ActionDispatch::IntegrationTest
  test "should get inicio" do
    get inicio_url
    assert_response :success
  end

  test "Deberia llegar al root" do
    get root_url
    assert_response 200
    assert_template "fijas/inicio"
  end

  test "should get colegio" do
    get colegio_url
    assert_response :success
  end

  test "should get lugares" do
    get lugares_url
    assert_response :success
  end

  test "should get fotos" do
    get galeria_url
    get "/galeria"
    assert_response :success
  end

end
