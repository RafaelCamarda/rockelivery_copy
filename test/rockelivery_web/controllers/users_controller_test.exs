defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = build(:user_params)

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created successfully",
               "user" => %{
                 "address" => "Rua das banananeiras 15",
                 "age" => 27,
                 "cep" => "12345678",
                 "cpf" => "12345678901",
                 "email" => "rafael@banana.com",
                 "id" => _id,
                 "name" => "Rafael Camarda"
               }
             } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = :user_params |> build() |> Map.drop(["name", "cpf"])

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{"cpf" => ["can't be blank"], "name" => ["can't be blank"]}
      }

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "e0cb8256-1eb5-4cc5-8549-4a61671b3d18"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
