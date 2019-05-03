defmodule TerrorWeb.Schema do
  use Absinthe.Schema

  alias Terror.Repo
  alias Terror.Clients

  object :company do
    field :id, :id
    field :name, non_null(:string)
  end

  query do
    field :companies, list_of(:company) do
      resolve fn _, _, _ ->
        {:ok, Clients.list_companies()}
      end
    end
  end

  mutation do
    field :create_company, :company do
      arg :name, non_null(:string)
      resolve fn _, args, _ ->
        Clients.create_company(args)
      end
    end
  end

  subscription do
    field :company_created, :company do
      config fn _args, _info ->
        {:ok, topic: true}
      end

      trigger :create_company, topic: fn _company ->
        true
      end
    end
  end
end
