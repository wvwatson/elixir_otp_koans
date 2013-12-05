defmodule ElixirOtpKoans do
  use Application.Behaviour

  @doc """
  The application callback used to start this
  application and its Dynamos.
  """
  def start(_type, _args) do
    ElixirOtpKoans.Dynamo.start_link([max_restarts: 5, max_seconds: 5])
    ElixirOtpKoans.ScStore.init
    case ElixirOtpKoans.ScSup.start_link do
      {:ok, pid} ->
        {:ok, pid}
      other ->
        {:error, other}
    end 
  end
end