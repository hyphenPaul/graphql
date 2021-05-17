defmodule Graphql.SkusTest do
  use Graphql.DataCase

  alias Graphql.Skus

  describe "skus" do
    alias Graphql.Skus.Sku

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def sku_fixture(attrs \\ %{}) do
      {:ok, sku} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Skus.create_sku()

      sku
    end

    test "list_skus/0 returns all skus" do
      sku = sku_fixture()
      assert Skus.list_skus() == [sku]
    end

    test "get_sku!/1 returns the sku with given id" do
      sku = sku_fixture()
      assert Skus.get_sku!(sku.id) == sku
    end

    test "create_sku/1 with valid data creates a sku" do
      assert {:ok, %Sku{} = sku} = Skus.create_sku(@valid_attrs)
      assert sku.title == "some title"
    end

    test "create_sku/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Skus.create_sku(@invalid_attrs)
    end

    test "update_sku/2 with valid data updates the sku" do
      sku = sku_fixture()
      assert {:ok, %Sku{} = sku} = Skus.update_sku(sku, @update_attrs)
      assert sku.title == "some updated title"
    end

    test "update_sku/2 with invalid data returns error changeset" do
      sku = sku_fixture()
      assert {:error, %Ecto.Changeset{}} = Skus.update_sku(sku, @invalid_attrs)
      assert sku == Skus.get_sku!(sku.id)
    end

    test "delete_sku/1 deletes the sku" do
      sku = sku_fixture()
      assert {:ok, %Sku{}} = Skus.delete_sku(sku)
      assert_raise Ecto.NoResultsError, fn -> Skus.get_sku!(sku.id) end
    end

    test "change_sku/1 returns a sku changeset" do
      sku = sku_fixture()
      assert %Ecto.Changeset{} = Skus.change_sku(sku)
    end
  end
end
