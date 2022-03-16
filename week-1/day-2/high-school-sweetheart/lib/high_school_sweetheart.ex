defmodule HighSchoolSweetheart do
  def first_letter(name) do
    # Please implement the first_letter/1 function
    String.first(String.trim(name))
  end

  def initial(name) do
    # Please implement the initial/1 function
    String.upcase(first_letter(name)) <> "."
  end

  def initials(full_name) do
    # Please implement the initials/1 function
    first = List.first(String.split(full_name))
    latter = List.last(String.split(full_name))
    (initial(first) <> " ") <> initial(latter)
  end

  def pair(full_name1, full_name2) do
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{initials(full_name1)}  +  #{initials(full_name2)}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """

    # Please implement the pair/2 function
  end
end
