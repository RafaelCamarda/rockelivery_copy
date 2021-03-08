defmodule Rockelivery.Factory do
  use ExMachina

  def user_params_factory do
    %{
      address: "Rua das banananeiras 15",
      age: 27,
      cep: "12345678",
      cpf: "12345678901",
      email: "rafael@banana.com",
      name: "Rafael Camarda",
      password: "123456"
    }
  end
end
