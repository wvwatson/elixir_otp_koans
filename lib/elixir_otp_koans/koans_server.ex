# test 1 make a module
defmodule ElixirOtpKoans.KoansServer do

 # test 6
 defrecord State, veggies: nil

 # test 2 make a gen server
 use GenServer.Behaviour

 # test 3, test 4
 def start_link do
   :gen_server.start_link({:local, __MODULE__}, __MODULE__, [], [])
 end

 # test 5
 def init([]) do
 end


end
