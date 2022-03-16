defmodule RobotSimulator do
  defstruct direction: :north, position: {0, 0}
  @valid_directions [:north, :east, :south, :west]

  @doc """
  Create a Robot Simulator given an initial direction and position.

  @directions [:north, :east, :south, :west]

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0}) do
    if valid_direction(direction) and valid_position(position) do
      %RobotSimulator{direction: direction, position: position}
    else
      cond do
        not valid_direction(direction) -> {:error, "invalid direction"}
        not valid_position(position) -> {:error, "invalid position"}
      end
    end
  end

  def valid_position({a, b}) when is_integer(a) and is_integer(b), do: true

  def valid_position(_position), do: false

  def valid_direction(direction) when direction in @valid_directions, do: true

  def valid_direction(_direction), do: false

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    instructions_list = String.split(instructions, "", trim: true)

    Enum.map(instructions_list, fn instruction ->
      case instruction do
        "R" -> turn_right(robot)
        "L" -> nil
        "A" -> nil
      end
    end)
  end

  defp atual_direction(robot) do
    Enum.find_index(@valid_directions, fn direction -> direction == robot.direction end)
  end

  defp turn_right(robot) do
    new_list_directions =
      Enum.slice(@valid_directions, atual_direction(robot)..-1) ++
        Enum.slice(@valid_directions, 0..(atual_direction(robot) - 1))
    new_direction = Enum.at(new_list_directions, atual_direction(robot) + 1)
    %{robot | direction: new_direction}
    |> Enum.at(0)
  end

  #  new_list_directions =
  #  [Enum.at(new_list_directions, atual_direction(robot) - 1),

  # new_direction = Enum.at(new_list_directions, atual_direction(robot) - 1)

  defp turn_left(robot) do
    new_list_directions =
      Enum.slice(@valid_directions, atual_direction(robot)..-1) ++
        Enum.slice(@valid_directions, 0..(atual_direction(robot) - 1))
    new_direction = Enum.at(new_list_directions, atual_direction(robot) - 1)
    %{robot | direction: new_direction}
    |> Enum.at(0)
  end

  defp advance(robot) do
    case robot.direction do
      :north -> nil
      :east -> nil
      :south -> nil
      :west -> nil
    end
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot.direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot.position
  end
end
