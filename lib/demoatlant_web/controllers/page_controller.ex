defmodule DemoatlantWeb.PageController do
  use DemoatlantWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
