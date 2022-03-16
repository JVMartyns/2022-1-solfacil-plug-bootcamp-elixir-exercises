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
    case instructions do

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
