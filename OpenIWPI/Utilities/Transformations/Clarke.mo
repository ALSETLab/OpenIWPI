within OpenIWPI.Utilities.Transformations;
model Clarke "Clarke transformation block."
  extends Modelica.Electrical.PowerConverters.Icons.Converter;
  Modelica.Blocks.Interfaces.RealOutput v_alfa annotation(Placement(visible = true, transformation(origin={110,40},   extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110,40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput v_beta annotation(Placement(visible = true, transformation(origin={110,-40},   extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput v_A annotation(Placement(visible = true, transformation(origin={-120,70},   extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput v_B annotation(Placement(visible = true, transformation(origin={-120,0},   extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput v_C annotation(Placement(visible = true, transformation(origin={-120,-70},   extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  v_alfa = 2 / 3 * (v_A - 1 / 2 * v_B - 1 / 2 * v_C);
  v_beta = 2 / 3 * (sqrt(3) / 2 * v_B - sqrt(3) / 2 * v_C);
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 1, grid = {10, 10}), graphics={  Text(visible = true, origin = {31.162, -33.218}, extent = {{-41.162, -43.218}, {41.162, 43.218}}, textString = "alfa-beta"), Text(visible = true, origin = {-30.792, 40}, extent = {{-29.208, -30.667}, {29.208, 30.667}}, textString = "abc")}));
end Clarke;
