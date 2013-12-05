Code.require_file "test_helper.exs", Path.join(__DIR__, "..")

defmodule KoansServerTest do
  use ExUnit.Case, async: false
  use ElixirOtpKoans.TestCase
  use Dynamo.HTTP.Case
  import ElixirOtpKoans.KoansServer
  require Lager
  
  def clean_up(pid) do
    :gen_server.cast(pid, :stop)
  end

  # test 1
  test "a koans server should exist" do
    assert true
  end
  
  # test 2
  test "koans server should be defined as a gen server" do
    
    case :gen_server.start_link(ElixirOtpKoans.KoansServer, [], []) do
      {:ok, pid} -> 
          pid
      {:error, {:already_started, pid}} -> 
          pid 
      other -> 
          assert false == "should have received :ok or :error and a pid" 
    end
    clean_up(pid)
  end

  # test 3 
  test "koans server should have a start_link api function that starts the server" do
    response = start_link
    case response do
      {:ok, pid} -> assert is_pid(pid)
      {:error, {:already_started, pid}} -> assert is_pid(pid) 
      other -> assert false == "should have received :ok or :error and a pid" 
    end
    clean_up(pid)
  end
  
  # test 4
  test "koans server should an api function that stops the server" do
    response = start_link
    case response do
      {:ok, pid} -> assert is_pid(pid)
      {:error, {:already_started, pid}} -> assert is_pid(pid) 
      other -> assert false == "should have received :ok or :error and a pid" 
    end
     # test 4.a
     # Leave the next line commented out normally, but run it 
     # with no handle cast and then with a handle cast and check the 
     # IO puts output. This demonstrates the default stop handler.
     # r = :gen_server.cast(pid, :stop)
    r = ElixirOtpKoans.KoansServer.stop(pid)
    assert r == :ok 
    # test 4.a default handler does not throw an exit
    assert {:normal, _} = catch_exit(:sys.get_status(pid))
  end

  # test 5 
  test "koans server start_link function should accept initial state" do
    response = start_link("cucumber")
    case response do
      {:ok, pid} -> assert is_pid(pid)
      {:error, {:already_started, pid}} -> assert is_pid(pid) 
      other -> assert false == "should have received :ok or :error and a pid" 
    end
    ElixirOtpKoans.KoansServer.stop(pid)
  end

  # test 6
  test "koans server should have an init function that accepts state" do
    IO.puts "Delay for a completely new process id" 
    IO.puts "Delay for a completely new process id" 
    IO.puts "Delay for a completely new process id" 
    IO.puts "Delay for a completely new process id" 
    response = start_link("cucumber")
    IO.puts inspect(response)
    case response do
      {:ok, pid} -> assert is_pid(pid)
      {:error, {:already_started, pid}} -> assert is_pid(pid) 
    end
    status = :sys.get_status(pid)
    assert {:status, _, {:module, :gen_server}, [["$ancestors": [_], "$initial_call": {ElixirOtpKoans.KoansServer, :init, 1}], :running, _, [], [header: _, data: _, data: [{_, ElixirOtpKoans.KoansServer.State[veggies: "cucumber"]}]]]} = status
    ElixirOtpKoans.KoansServer.stop(pid)
  end 

  # test 7 
  test "koans server should have a handle cast that allows you to fetch its state " do
    response = start_link("cucumber")
    case response do
      {:ok, pid} -> assert is_pid(pid)
      {:error, {:already_started, pid}} -> assert is_pid(pid) 
    end
    ret = :gen_server.call(pid, :fetch)
    assert ret == ElixirOtpKoans.KoansServer.State[veggies: "cucumber"]
    ElixirOtpKoans.KoansServer.stop(pid)
  end 

  # test 8 
  test "koans server should have an api that wraps the fetch call " do
    response = start_link("cucumber")
    case response do
      {:ok, pid} -> assert is_pid(pid)
      {:error, {:already_started, pid}} -> assert is_pid(pid) 
    end
    ret = fetch(pid) 
    assert ret == ElixirOtpKoans.KoansServer.State[veggies: "cucumber"]
    ElixirOtpKoans.KoansServer.stop(pid)
  end 

end
