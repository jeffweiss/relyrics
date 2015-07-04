defmodule Robert do

  @external_resource dictionary_path = Path.join([__DIR__, "..", "data", "OTP_dictionary.txt"])
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def init do
    {:ok, nil}
  end

  analyzed_dictionary = File.stream!(dictionary_path)
  |> Stream.map(&String.strip/1)
  |> Stream.map(&( {&1 |> String.to_char_list |> Enum.sort, &1}))
  |> Enum.reduce(%{}, fn ({char_head, word}, map) -> list = Map.get(map, char_head, []); Map.put(map, char_head, [word|list]) end)

  for {char_head, word_list} <- analyzed_dictionary do
    def possible_words(unquote(char_head)), do: unquote(word_list)
  end
end
