# test 1 make a module
defmodule ElixirOtpKoans.KoansServer do

  # test 6
  defrecord State, veggies: nil

  # test 2 make a gen server
  use GenServer.Behaviour

  # test 3
  def start_link do
    :gen_server.start_link({:local, __MODULE__}, __MODULE__, [], [])
  end

  # test 4
  def init([]) do
    state = State.new
    {:ok, state}
  end
  
  # test 5
  def handle_cast(:stop, state) do
    IO.puts "DEBUG: hand_cast :stop"
    {:stop, :normal, state}
  end

  # test 5
  def stop(pid) do
    :gen_server.cast(pid, :stop)
  end 

 # test 6
  def start_link(state) do
    :gen_server.start_link({:local, __MODULE__}, __MODULE__, [state], [])
  end

  # test 7
  def init([veggies]) do
   state = State.new(veggies: veggies)
   {:ok, state}
  end

  # test 8
  def handle_call(:fetch, _from, state) do
    {:reply, state, state}
  end

  # test 9
  def fetch(pid) do
    ret = :gen_server.call(pid, :fetch)
  end

end
