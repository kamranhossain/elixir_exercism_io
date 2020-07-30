defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split([" ", "_", ",", "?", "!"])
    # filter out only words
    |> Enum.filter(&Regex.run(~r/[\w\d]+/, &1))
    # make word count map, create or update map word input Map.update 4 arity function.
    |> Enum.reduce(%{}, fn word, counts -> Map.update(counts, word, 1, &(&1 + 1)) end)
  end
end
