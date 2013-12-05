Code.require_file "test_helper.exs", Path.join(__DIR__, "..")

defmodule ScAppTest do
  use ElixirOtpKoans.TestCase
  use Dynamo.HTTP.Case

  test "start should return ok" do
    {atom, pid} = ElixirOtpKoans.ScApp.start(ElixirOtpKoans.ScApp,  [])
    case ElixirOtpKoans.ScApp.start(ElixirOtpKoans.ScApp,  []) do
      {:ok, pid} ->
        assert is_pid(pid) == true
      {:error,{:error, {:already_started, pid}}} -> 
        assert is_pid(pid) == true
    end
  end

  #test "gen server start should return ok" do
  #  {atom, pid} = :gen_server.start_link(ElixirOtpKoans.ScApp, :ok, [])
  #  assert atom == :ok
  #  assert is_pid(pid) == true
  #end

  test "cast stop should return ok" do
    atom = ElixirOtpKoans.ScApp.stop([])
    assert atom == :ok
  end

  test "start should create an ets table" do
    {atom, pid} = ElixirOtpKoans.ScApp.start(ElixirOtpKoans.ScApp,  [])
    assert Enum.member?(:ets.all, ElixirOtpKoans.ScStore) == true
  end

end
