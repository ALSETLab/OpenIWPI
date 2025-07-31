within OpenIWPI.Utilities.Transformations;
model Park "Park transformation block."
  extends Modelica.Electrical.PowerConverters.Icons.Converter;
  Modelica.Blocks.Interfaces.RealInput delta annotation(Placement(visible = true, transformation(origin={0,-120},   extent = {{-20, -20}, {20, 20}}, rotation=90),  iconTransformation(origin = {0,-120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput v_d annotation(Placement(visible = true, transformation(origin={110,40},   extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput v_q annotation(Placement(visible = true, transformation(origin={110,-40},   extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput v_alfa annotation(Placement(visible = true, transformation(origin={-120,40},   extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput v_beta annotation(Placement(visible = true, transformation(origin={-120,-40},   extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  v_d = v_alfa * Modelica.Math.cos(delta) + v_beta * Modelica.Math.sin(delta);
  v_q = (-v_alfa * Modelica.Math.sin(delta) + v_beta * Modelica.Math.cos(delta));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics={  Text(visible = true, origin = {-20, 40}, extent = {{-41.162, -43.218}, {41.162, 43.218}}, textString = "alfa-beta"), Text(visible = true, origin = {40, -39.825}, extent = {{-19.215, -20.175}, {19.215, 20.175}}, textString = "dq")}));
end Park;
