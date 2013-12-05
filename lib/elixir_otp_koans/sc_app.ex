defmodule ElixirOtpKoans.ScApp do
  use Application.Behaviour

  def start(_starttype, _startargs) do
    ElixirOtpKoans.ScStore.init
    case ElixirOtpKoans.ScSup.start_link do
      {:ok, pid} ->
        {:ok, pid}
      other ->
        {:error, other}
    end 
  end

  def stop(_state) do
    :ok
  end
  
end
