Code.require_file "test_helper.exs", Path.join(__DIR__, "..")

defmodule KoansServerTest do
  use ExUnit.Case, async: false
  use ElixirOtpKoans.TestCase
  use Dynamo.HTTP.Case
  import ElixirOtpKoans.KoansServer
  require Lager


  #setup_all do
  #  # must start supervisor first
  #  case ElixirOtpKoans.ScApp.start(ElixirOtpKoans.ScApp,  []) do
  #    {:ok,pid} -> {:ok, setuppid: pid}
  #    {:error,{:error, {:already_started, pid}}} -> {:ok, setuppid: pid}
  #    other -> Lager.debug "ElixirOtpKoans.ScApp.start ret: #{inspect(other)}"; other
  #  end
  #end

  ###### koans start

  # test 1
  test "a koans server should exist" do
    assert true
  end
  
  # test 2
  test "koans server should be defined as a gen server" do
    :gen_server.start_link(ElixirOtpKoans.KoansServer, [], [])
  end

  # test 3
  test "koans server should have a start_link function" do
    start_link
  end

  # test 4 
  test "koans server should start a local server" do
    response = start_link
    case response do
      {:ok, pid} -> assert is_pid(pid)
      {:error, {:already_started, pid}} -> assert is_pid(pid) 
      other -> assert false == "should have received :ok or :error and a pid" 
    end
  end
  # test 5
  test "koans server should have an init function" do
    init([])
  end 
  # test 6
  test "koans server should be able to stop" do
    response = start_link
    case response do
      {:ok, pid} -> assert is_pid(pid)
      {:error, {:already_started, pid}} -> assert is_pid(pid) 
      other -> assert false == "should have received :ok or :error and a pid" 
    end
    r = ElixirOtpKoans.KoansServer.stop(pid)
    assert r == :ok
    assert {:normal, _} = catch_exit(:sys.get_status(pid))
  end
  ## test 7 
  #test "koans server start_link function should accept initial state" do
  #  response = start_link("cucumber")
  #  case response do
  #    {:ok, pid} -> assert is_pid(pid)
  #    {:error, {:already_started, pid}} -> assert is_pid(pid) 
  #    other -> assert false == "should have received :ok or :error and a pid" 
  #  end
  #end
  ## test 7
  #test "koans server should have an init function that accepts state" do
  #  :gen_server.cast(ElixirOtpKoans.KoansServer, :stop) 
  #  response = start_link("cucumber")
  #  case response do
  #    {:ok, pid} -> assert is_pid(pid)
  #    {:error, {:already_started, pid}} -> assert is_pid(pid) 
  #  end
  #  status = :sys.get_status(pid)
  #  assert {:status, _, {:module, :gen_server}, [["$ancestors": [_], "$initial_call": {ElixirOtpKoans.KoansServer, :init, 1}], :running, _, [], [header: _, data: _, data: [{_, ElixirOtpKoans.KoansServer.State[veggies: "cucumber"]}]]]} = status
  #end 

  # test 6
  #test "koans server should have an init function" do
  #  record = Module.get_attribute ExlistOtpKoans.KoansServer, :state == ElixirOtpKoans.KoansServer.State[veggies: nil]
  #  assert record == ElixirOtpKoans.KoansServer.State[veggies: nil]
  #end
  



  ###### koans end


  #test ".create/2 should start a child process with the passed state" do
  #  {scstarted, scpid} = create("hmm", (60 * 60 * 24))
  #  assert scstarted == :ok
  #  assert is_pid(scpid) == true
  #end
  #test ".create/1 should start a child process with the passed state" do
  #  {scstarted, scpid} = create("hmm")
  #  assert scstarted == :ok
  #  assert is_pid(scpid) == true
  #end
  #test ".time_left/2 _/atom should return infinity" do 
  #  now = :calendar.local_time
  #  start_time = :calendar.datetime_to_gregorian_seconds(now)
  #  assert :infinity == time_left(start_time, :infinity)
  #end
  #test ".time_left/2 _/_ should return a good lease" do 
  #  now = :calendar.local_time
  #  start_time = :calendar.datetime_to_gregorian_seconds(now)
  #  assert 0 == time_left(0, 5000)
  #  assert 5000000 <= time_left(start_time, 5000)
  #end
  #test ".fetch should return the value for some saved state" do 
  #  {scstarted, scpid} = create("sc_element_hmm")
  #  fret = fetch(scpid)
  #  assert fret == {:ok, "sc_element_hmm"}
  #end
  #test ".replace should return a new value for s valuome saved state" do 
  #  {cstarted, cpid} = create("sc_element_hmm")
  #  ret = :gen_server.cast(cpid, {:replace, "sc_element_hmm2"})
  #  assert ret == :ok
  #  fret = fetch(cpid)
  #  assert fret == {:ok, "sc_element_hmm2"}
  #end
  #test ".handle_cast/2 tuple should return a new value for some saved state" do 
  #  {cstarted, cpid} = create("hmm")
  #  ret = replace(cpid, "hmm2")
  #  assert ret == :ok
  #  fret = fetch(cpid)
  #  assert fret == {:ok, "hmm2"}
  #end
  #test ".delete should remove a value and its process from the universe", meta do
  #  apppid = meta[:setuppid]
  #  {cstarted, cpid} = create("hmm")
  #  ret = ElixirOtpKoans.ScElement.delete(cpid)
  #  assert ret == :ok
  #  Lager.debug "info cpid: #{inspect(Process.info(cpid))}"
  #  Lager.debug "info apppid: #{inspect(Process.info(apppid))}"
  #  Lager.debug "alive? cpid: #{inspect(Process.alive?(cpid))}"
  #  Lager.debug "alive? apppid: #{inspect(Process.alive?(apppid))}"
  #  Lager.debug "this probably needs a delay ... sometimes this fails"
  #  assert Process.alive?(cpid) == false
  #end
end
