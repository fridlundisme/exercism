defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    counter = 0
    count(strand,nucleotide,counter)
  end
  def count([], nucleotide, count) do count end
  def count([h | t], h, counter) do
    count(t, h, counter+1)
  end
  def count([h | t], x, counter) do
    count(t, x, counter)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    %{?A => count(strand, ?A), ?T => count(strand, ?T), ?C => count(strand, ?C), ?G => count(strand, ?G)}
  end
end
