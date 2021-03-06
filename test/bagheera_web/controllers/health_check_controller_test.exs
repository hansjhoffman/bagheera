defmodule BagheeraWeb.HealthCheckControllerTest do
  use BagheeraWeb.ConnCase

  test "GET /health", %{conn: conn} do
    response = get(conn, Routes.health_check_path(conn, :index))

    expected = %{
      "status" => "pass",
      "version" => to_string(Application.spec(:bagheera, :vsn))
    }

    assert expected == json_response(response, 200)
  end
end
